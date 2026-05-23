# 🚀 智价AI - 一键云端部署指南

## 目标
让任何人通过一个网址就能直接使用，无需安装任何东西！

## 最终效果
部署完成后，你会得到一个类似这样的地址：
```
https://aicost-xxx.vercel.app/aicost/
```

把这个地址发给任何人，他们打开就能使用！

---

## 📋 部署前准备

### 1. 安装 Git
下载地址：https://git-scm.com/download/win

安装时一路点击 "Next" 即可。

### 2. 注册三个账号（全部免费）

| 平台 | 用途 | 注册地址 |
|------|------|----------|
| GitHub | 存放代码 | https://github.com/signup |
| Render | 运行后端+数据库 | https://dashboard.render.com |
| Vercel | 托管前端页面 | https://vercel.com/signup |

> 💡 建议用同一个邮箱注册

---

## 🚀 部署步骤（总共约10分钟）

### 第一步：上传代码到 GitHub（2分钟）

1. **创建 GitHub 仓库**
   - 访问 https://github.com/new
   - Repository name: `aicost`
   - 选择 **Public**（公开）
   - **不要勾选** "Add a README file"
   - 点击 **Create repository**

2. **上传代码**
   
   在项目文件夹 `aicost-main` 中，右键选择 "Git Bash Here"，然后执行：

   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   
   # 注意：替换下面的用户名
   git remote add origin https://github.com/你的用户名/aicost.git
   git branch -M main
   git push -u origin main
   ```

   输入 GitHub 用户名和密码/Token 完成上传。

---

### 第二步：部署后端到 Render（5分钟）

1. **访问 Render Blueprint**
   - 打开 https://dashboard.render.com/blueprint
   - 点击 **"Connect a repository"**

2. **连接 GitHub**
   - 选择你的 GitHub 账号
   - 授权 Render 访问
   - 找到 `aicost` 仓库，点击 **Connect**

3. **一键部署**
   - Render 会自动识别 `render.yaml` 配置文件
   - 点击 **Apply** 开始部署
   - 等待约 **5-10 分钟**

4. **记录后端地址**
   - 部署成功后，点击服务名称
   - 复制地址，例如：
     ```
     https://aicost-backend-abc123.onrender.com
     ```

5. **验证后端**
   - 在浏览器访问：`https://aicost-backend-xxx.onrender.com/docs`
   - 如果能看到 API 文档，说明部署成功！

---

### 第三步：部署前端到 Vercel（3分钟）

1. **导入项目**
   - 访问 https://vercel.com/new
   - 点击 **Import Git Repository**
   - 选择 `aicost` 仓库

2. **配置项目**

   | 配置项 | 填写内容 |
   |--------|----------|
   | Framework Preset | **Vite** |
   | Root Directory | **frontend** |
   | Build Command | `npm run build` |
   | Output Directory | `dist` |

3. **添加环境变量**
   - 点击 **Environment Variables**
   - 添加变量：
     - Name: `VITE_API_BASE`
     - Value: `https://你的后端地址.onrender.com/api`
   - 例如：`https://aicost-backend-abc123.onrender.com/api`

4. **开始部署**
   - 点击 **Deploy**
   - 等待约 **2-3 分钟**

5. **获取访问地址**
   - 部署成功后，Vercel 会显示：
     ```
     https://aicost-xxx.vercel.app/aicost/
     ```

---

## ✅ 完成！

### 你的专属网址

```
https://aicost-xxx.vercel.app/aicost/
```

**把这个地址发给任何人，他们打开就能直接使用，无需安装任何东西！**

---

## 📝 后续维护

### 如何更新代码？

修改代码后，在 Git Bash 中执行：

```bash
git add .
git commit -m "更新说明"
git push
```

Render 和 Vercel 会自动重新部署！

### 免费额度说明

| 服务 | 免费额度 | 够用吗？ |
|------|----------|----------|
| Vercel | 100GB/月 | ✅ 完全够用 |
| Render Web | 750小时/月 | ✅ 约31天 |
| Render DB | 1GB 存储 | ✅ 数万条数据 |

### 自定义域名（可选）

1. 在 Vercel 项目设置中点击 **Domains**
2. 输入你的域名，如 `aicost.yourdomain.com`
3. 按提示添加 DNS 记录

---

## ❓ 常见问题

**Q: Render 服务休眠了怎么办？**  
A: 免费版一段时间不访问会休眠，首次访问可能需要等待30秒唤醒。可以绑定信用卡设置永不休眠。

**Q: 数据会丢失吗？**  
A: 不会。PostgreSQL 数据会永久保留。

**Q: 部署失败怎么办？**  
A: 查看 Render/Vercel 的部署日志，检查错误信息。

---

**现在就开始部署吧！10分钟后你就能拥有一个可以分享给任何人的在线应用！** 🎉
