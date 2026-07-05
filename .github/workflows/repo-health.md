---
on:
  workflow_dispatch:

engine:
  id: gemini
  model: gemini-2.0-flash

permissions:
  contents: read

network: defaults

safe-outputs:
  create-issue:
  add-comment:

---

# NekoCore-OS 仓库健康分析

对整个仓库进行全面的健康状况评估，生成改进建议报告。

## Instructions

全面分析这个仓库，从以下几个维度出具评估报告：

### 1. 项目结构
- 目录结构是否合理，有没有明显的组织问题
- 核心入口文件是否清晰可辨
- 配置文件是否完整（package.json, docker-compose 等）

### 2. 代码质量
- 扫描 JavaScript/CSS/HTML 文件的规模分布
- 识别过大或职责不清的模块
- 检查代码风格一致性
- 检查是否有明显的死代码或重复代码

### 3. 文档健康度
- README 是否完整（安装说明、使用方式、API 文档、贡献指南）
- docs/ 目录是否有过时或空文档
- 代码注释覆盖率是否合理
- LICENSE 是否存在

### 4. 基础设施
- CI/CD 配置是否存在
- Docker 配置是否合理
- 依赖管理是否规范
- .gitignore 是否完整

### 5. 改进建议
- 列出前 5 个最值得改进的问题
- 每个问题标注严重程度（高/中/低）
- 给出具体的改进建议

最终输出一份结构化的 markdown 报告，创建为一个 issue 提交。
