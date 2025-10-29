# nginx-ffmpeg-latest-frame

An **Ansible + Docker** solution that deploys a lightweight web service to display the **latest frame** from a video stream.  
Built using **NGINX** (for hosting) and **FFmpeg** (for frame extraction).

---

## 📋 Requirements

- Linux host (Ubuntu recommended)
- Ansible installed locally
- Docker installed on the remote host (the playbook installs it automatically)
- SSH access to the target host (using `.pem` key)

---

## 🚀 How it works

1. **FFmpeg container** continuously reads the video stream:
   ```
   https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4
   ```
   and updates `/frames/latest.jpg` with the **most recent frame**.

2. **NGINX container** serves this image from its web root:
   - `index.html` displays the latest frame at the root (`/`).
   - When you **open or refresh** the page, it shows the newest frame.

---

## 🛠 Deployment Instructions

1. Copy your SSH key into the project folder:
   ```bash
   cp /path/to/latest_frame-key.pem ansible/
   chmod 600 ansible/latest_frame-key.pem
   ```

2. Check connections
   ```bash
   ansible all -m ping  
   ```

3. Run the Ansible playbook:
   ```bash
   cd ansible
   ansible-playbook site.yml
   ```

4. When finished, open your browser and go to:
   ```
   http://<your-url>/
   ```

   You will see the latest frame displayed.

---

## ⚙️ Key Design Rules

✅ The frame is displayed at the **root level** (`index`).  
✅ **No NGINX configuration changes** are required — the default image is used.  
✅ Containers are **self-contained** and **restart automatically**.  
✅ The solution remains available even if NGINX config changes.

---

## 🔒 Security

- `.gitignore` excludes all sensitive files such as `.pem`, `.key`, and `.pub`.
- If any SSH key was ever committed, rotate it immediately in AWS.
- Use limited-scope SSH keys when possible.

---

## 🌍 Terraform (optional)

The `terraform/` folder can be used to **provision your EC2 host** automatically.  
Typical workflow:

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

After Terraform finishes, it outputs your instance’s **public DNS or IP**.  
Use that in your Ansible `inventory.ini` file.

Example:
```ini
[frame]
ec2-IP ansible_user=ubuntu ansible_ssh_private_key_file=latest_frame-key.pem
```

Then run:
```bash
cd ../ansible
ansible-playbook site.yml
```