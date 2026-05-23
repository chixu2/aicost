# 智价AI - 一键部署指南

将项目部署到云端，让别人通过一个网址就能直接使用。

## 部署架构

- **前端**: Vercel (免费静态托管)
- **后端**: Render (免费 Web 服务)
- **数据库**: Render PostgreSQL (免费)

## 部署步骤

### 1. 部署后端到 Render

1. 访问 [Render Dashboard](https://dashboard.render.com/)
2. 点击 "New +" → "Blueprint"
3. 连接你的 GitHub 仓库
4. 选择 `aicost` 项目
5. Render 会自动识别 `render.yaml` 并部署
6. 等待部署完成，记录后端地址：`https://aicost-backend.onrender.com`

### 2. 部署前端到 Vercel

1. 访问 [Vercel Dashboard](https://vercel.com/dashboard)
2. 点击 "Add New..." → "Project"
3. 导入你的 GitHub 仓库
4. 配置：
   - Framework Preset: Vite
   - Root Directory: `frontend`
   - Build Command: `npm run build`
   - Output Directory: `dist`
5. 添加环境变量：
   - `VITE_API_BASE`: `https://aicost-backend.onrender.com/api`
6. 点击 Deploy

### 3. 更新 API 地址（如果需要）

如果 Render 分配了不同的域名，修改前端环境变量：

```bash
# 修改 frontend/.env.production
VITE_API_BASE=https://你的后端地址.onrender.com/api
```

然后重新部署前端。

## 访问地址

部署完成后，你会得到两个地址：

- **前端**: `https://aicost-xxx.vercel.app/aicost/` (用户访问)
- **后端**: `https://aicost-backend.onrender.com` (API 服务)
- **API 文档**: `https://aicost-backend.onrender.com/docs`

## 免费额度说明

| 服务 | 免费额度 |
|------|---------|
| Vercel | 无限带宽，100GB/月 |
| Render Web | 750小时/月 (永不休眠需绑定信用卡) |
| Render DB | 1GB 存储，永不删除 |

## 自定义域名（可选）

### Vercel 自定义域名
1. 进入项目 Settings → Domains
2. 添加你的域名
3. 按提示配置 DNS

### Render 自定义域名
1. 进入服务 Settings → Custom Domains
2. 添加你的域名
3. 配置 DNS CNAME 记录

## 故障排查

### 前端无法连接后端
1. 检查 CORS 配置：`backend/app/main.py` 中 `allow_origins` 包含前端域名
2. 检查环境变量：`VITE_API_BASE` 是否正确

### 数据库连接失败
1. 检查 Render PostgreSQL 是否运行
2. 检查 `DATABASE_URL` 环境变量

### 部署失败
1. 查看 Render/Vercel 的部署日志
2. 检查 `requirements.txt` 和 `package.json` 是否完整

## 技术栈

- **前端**: React + TypeScript + Vite
- **后端**: FastAPI + SQLAlchemy
- **数据库**: PostgreSQL
- **AI**: OpenAI / DeepSeek / 通义千问 (可选)

---

部署完成后，把 Vercel 的前端地址发给其他人，他们就能直接使用了！
