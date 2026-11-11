# CWYZ Agent 技能（cwyz-skill）

[English](#english)

让你的 AI Agent（Claude Code、Codex、OpenClaw、Hermes、Cursor 等）带你学会用 AI Agent。教程全部来自 [CWYZ cwyz.com](https://cwyz.com)，免费可学。

- **cwyz-learn**：陪学。先问你想用 AI 做什么、手上有什么工具，再从站上挑合适的入门教程，一步一步带你做完，教程里的提示词由 Agent 直接执行。
- **cwyz-ask**：问答。用 API Key 向 CWYZ 的问答助手提问，回答带站内出处。

**免费使用**：教程免费看，不用注册就能开始。每篇教程有一段核心内容要登录后用 1 积分解锁（注册送 10 积分，每天签到再领 1 积分）。问答免费账号每天 1 次，会员每天 30 次。

## 最快的用法：一句话

不用安装任何东西，直接对你的 Agent 说：

```
学习这个 skill，带我从零开始学会用 AI Agent：https://cwyz.com/api/skills/cwyz-learn/raw
```

英文版是 `https://cwyz.com/api/skills/cwyz-learn-en/raw`。问答技能是 `https://cwyz.com/api/skills/cwyz-ask/raw`。

## 装成本地 skill

本仓库的 `skills/` 目录就是站上这两个技能的副本：

| 目录 | 技能 | 语言 |
| ---- | ---- | ---- |
| `skills/cwyz-learn-zh/` | cwyz-learn | 中文 |
| `skills/cwyz-learn/` | cwyz-learn | 英文 |
| `skills/cwyz-ask-zh/` | cwyz-ask | 中文 |
| `skills/cwyz-ask/` | cwyz-ask | 英文 |

同一个技能的中英文两份 skill 名相同，**二选一装一份即可**。

**用 skills CLI**（支持 Claude Code、Codex、Cursor 等多种 Agent）：

```bash
npx skills add clinchcc/cwyz-skill
```

**手动复制**，以 Claude Code 为例：

```bash
git clone https://github.com/clinchcc/cwyz-skill.git
mkdir -p ~/.claude/skills
cp -r cwyz-skill/skills/cwyz-learn-zh ~/.claude/skills/cwyz-learn
cp -r cwyz-skill/skills/cwyz-ask-zh ~/.claude/skills/cwyz-ask
```

Codex 放到 `~/.codex/skills/`，其他 Agent 放到它读取 skill 的目录。站上的版本随时更新，本仓库会定期同步；以站上的为准。

## 能做什么

直接说需求就行，不用记命令：

- 「我想学 AI Agent，从哪开始？」→ 问你三道选择题，推荐 3 篇最贴近你目标的入门教程
- 「带我做这篇 https://cwyz.com/zh/tutorials/...」→ 按教程一步一步带你做，装软件和花钱之前先问你
- 「下一篇学什么？」→ 按你的进度推荐下一篇
- 「MCP 和 Skill 有什么区别？」→ 用 cwyz-ask 向站内问答助手提问，回答带出处

## 学习进度和密钥

- 进度经你同意后保存在本机 `~/.cwyz/progress.json`，只记学过哪几篇，不上传。
- 问答的 API Key 在 https://cwyz.com/settings/apikeys 创建，保存在 `~/.cwyz/config.json`（或环境变量 `CWYZ_API_KEY`），请求头 `Authorization: Bearer ...`。

## 用到的地址

| 用途 | 地址 |
| ---- | ---- |
| 全部教程列表（带难度标注） | `https://cwyz.com/llms.txt` |
| 入门路线 | `https://cwyz.com/zh/paths/beginner`、`https://cwyz.com/paths/beginner` |
| 教程页面 | `https://cwyz.com/zh/tutorials/<slug>`、`https://cwyz.com/tutorials/<slug>-en` |
| 问答接口 | `POST https://cwyz.com/api/v1/ask` |
| 技能原文 | `https://cwyz.com/api/skills/<名字>/raw` |

## 规则

- Agent 只推荐站上真实存在的教程，不编步骤。
- 需要解锁的段落由你在站上解锁，Agent 不会绕过。
- 装软件、登录账号、付费、删除文件或对外发布之前，Agent 会先问你。
- Agent 不会把密钥回显给你，也不会写进日志。

---

## English

Let your AI agent (Claude Code, Codex, OpenClaw, Hermes, Cursor…) teach you how to use AI agents, with free tutorials from [CWYZ](https://cwyz.com).

- **cwyz-learn**: a tutor. It asks what you want AI to do and which tools you have, picks beginner tutorials from the site, and walks you through them one step at a time. Your agent runs the tutorial's prompts itself.
- **cwyz-ask**: Q&A. Ask CWYZ's assistant with an API key and get answers with links back to the site.

**Free to use**: tutorials are free to read, no sign-up needed to start. Each tutorial has one key section you unlock with 1 credit after signing in (new accounts get 10 credits, plus 1 per daily check-in). Q&A gives free accounts 1 question a day and members 30.

**One line, nothing to install**. Tell your agent:

```
Learn this skill and teach me to use AI agents from scratch: https://cwyz.com/api/skills/cwyz-learn-en/raw
```

**Or install it locally** (each skill has a Chinese and an English copy with the same name; install one):

```bash
npx skills add clinchcc/cwyz-skill
# or
git clone https://github.com/clinchcc/cwyz-skill.git
cp -r cwyz-skill/skills/cwyz-learn ~/.claude/skills/cwyz-learn
cp -r cwyz-skill/skills/cwyz-ask ~/.claude/skills/cwyz-ask
```

The live versions on cwyz.com are the source of truth; this repository mirrors them.

## License

MIT
