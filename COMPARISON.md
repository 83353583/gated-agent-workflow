# 与同类方案对比

本工作流属于广义的 **Spec-Driven / 分阶段 Agent 开发**，但强调 **成本档位、防上下文压缩硬停、可复制 Handoff、启动/维护分叉**。

## 同族方案

| 方案 | 核心 | 与本仓库关系 |
|------|------|----------------|
| [GitHub Spec Kit](https://github.com/github/spec-kit) | Specify → Plan → Tasks → Implement，多 Agent 适配 | 最主流 SDD 工具箱；可在 implement 阶段叠加本仓库门禁与 Handoff |
| [SDD Skill](https://github.com/mariano-aguero/spec-driven-development-skill) | constitution → spec → plan → tasks → validate | 技能化 SDD；本仓库更轻、更强调硬停与成本 |
| OpenSpec 等 | 变更相对现有 spec 的 diff | 维护期思路接近本仓库「变更单」 |
| BMAD | 多角色、PRD、质量门 | 更重企业仪式；本仓库偏个人/小团队 AI 全程开发 |
| RIPER / CursorRIPER | Research→Innovate→Plan→Execute→Review + memory bank | 模式隔离强；本仓库用 Handoff 文本接力而非强绑 memory 文件结构 |

## 本仓库相对优势

1. **模型档位写进步骤表**，直接服务成本控制。  
2. **每步硬停** 明确对抗长会话自动压缩。  
3. **Handoff 可复制** 为一等交付物，换人换工具都方便。  
4. **Bootstrap / Change** 两套入口，维护不必走从零大流程。  
5. **技术栈可延后冻结**，适合全程 AI、选型后置。  
6. **零 CLI 依赖**，拷贝 Markdown 即可。

## 本仓库相对劣势

1. 步步门禁，小改若不用旁路会显得重。  
2. 生态与教程量不及 Spec Kit。  
3. 纪律主要靠人类执行，缺少强制状态机/CLI。  
4. 与「同会话自动连续实现」的产品默认行为相反，需要使用者有意识停。

## 怎么选

| 你的情况 | 建议 |
|----------|------|
| 要跟主流、团队多工具统一 | Spec Kit 为主，本仓库 Handoff/档位作补丁 |
| 强控成本、强防压缩、常换模型 | **本仓库为主** |
| 已有大项目、频繁加需求 | 本仓库变更流（或 OpenSpec + 本 Handoff） |
| 只要会话交接 | 可只抽取 `templates/handoff.md` |
