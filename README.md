# indie-app-shipping

> A solo/indie playbook for shipping small iOS/macOS & Android apps fast, testing real demand, and deepening only the apps that show signal.
>
> Bộ playbook cho solo/indie dev: ship app nhỏ iOS/macOS & Android thật nhanh, đo nhu cầu thật, và chỉ đào sâu những app có tín hiệu.

This is an **agent skill / rules pack**, not an app. It teaches an AI coding agent the repeatable workflow for shipping small mobile apps: the standard app skeleton, store metadata & ASO, screenshots, Apple/Google compliance checklists, review notes, pricing, and the signal-based decision of which apps to invest in.

Đây là một **skill/rules pack cho AI agent**, không phải app. Nó dạy agent quy trình lặp lại để ship app nhỏ: skeleton chuẩn, metadata & ASO, screenshot, checklist tuân thủ Apple/Google, review note, pricing, và cách quyết định app nào đáng đầu tư dựa trên tín hiệu.

---

## English

### What's inside

```
indie-app-shipping/            ← the skill folder (copy this into your agent)
├── SKILL.md                   ← orchestrator: strategy, workflow, decision rules
├── references/
│   ├── shared/                ← signal-metrics, pricing-monetization
│   ├── ios/                   ← skeleton, metadata, screenshots, review-guidelines, review-notes, macos
│   └── android/               ← skeleton, metadata-aso, screenshots, play-policies, submission
└── assets/                    ← fill-in legal templates (privacy policy, EULA, deletion page)
AGENTS.md                      ← cross-tool entry (Cursor / Gemini / Antigravity / Claude Code)
install.sh                     ← one-command installer for any agent above
```

The reference files are plain Markdown, so the **content is portable to any agent**. What differs per tool is only the *entry file* and *how it's loaded*.

### Multi-agent compatibility

| Tool | Format used | Where to put it | How it loads |
|---|---|---|---|
| **Claude Code** | Native skill | `~/.claude/skills/indie-app-shipping/` (global) or `<project>/.claude/skills/indie-app-shipping/` | Auto, matched by the `description` field |
| **Claude.ai / Cowork** | `.skill` upload | Settings → Capabilities → Skills | Auto, by description |
| **Google Antigravity** | Native skill (same `SKILL.md` format) | `.agents/skills/indie-app-shipping/` (workspace) or `~/.gemini/antigravity/skills/` (global) | Auto, by description |
| **Cursor** | `AGENTS.md` (or `.cursor/rules/*.mdc`) | repo root `AGENTS.md` | Read at session start |
| **Gemini CLI** | `AGENTS.md` (or `GEMINI.md`) | repo root `AGENTS.md`, or append to `~/.gemini/GEMINI.md` | Always in context |

> **Good news:** Claude and Antigravity use the *identical* skill format (`SKILL.md` + `references/` + `assets/`, loaded on demand by the description), so the skill folder is essentially drop-in for both. Cursor and Gemini use an always-on rules file — for them, `AGENTS.md` is the common standard and points to the same reference files.

### Install

**Quick install (recommended)** — the bundled `install.sh` copies the skill to the right place for your agent:

```bash
git clone https://github.com/cuongdev/indie-app-shipping.git
cd indie-app-shipping
chmod +x install.sh
./install.sh                  # interactive menu — pick your agent
# or non-interactive:
./install.sh claude           # Claude Code, global (~/.claude/skills)
./install.sh claude-project   # Claude Code, into a project you choose
./install.sh antigravity      # Antigravity, global
./install.sh antigravity-ws   # Antigravity, into a workspace (.agents/skills)
./install.sh cursor           # writes AGENTS.md (+ references) into a project
./install.sh gemini           # writes AGENTS.md (+ references) into a project
```

It asks before overwriting an existing install, and runs on macOS's default bash.

**Manual install** — if you'd rather copy by hand:

**Claude Code**
```bash
# global (available in every project)
git clone https://github.com/cuongdev/indie-app-shipping.git
cp -r indie-app-shipping/indie-app-shipping ~/.claude/skills/
# or per-project:
cp -r indie-app-shipping/indie-app-shipping <project>/.claude/skills/
```

**Claude.ai / Cowork** — package the skill folder and upload the `.skill` file under Settings → Capabilities → Skills. (You can repackage with Anthropic's `package_skill.py`, or zip the `indie-app-shipping/` folder and rename to `.skill`.)

**Antigravity**
```bash
# workspace
cp -r indie-app-shipping/indie-app-shipping <workspace>/.agents/skills/
# or global
cp -r indie-app-shipping/indie-app-shipping ~/.gemini/antigravity/skills/
```

**Cursor** — copy `AGENTS.md` to your project root. Cursor reads it automatically. (Optional: convert to a `.cursor/rules/indie-app-shipping.mdc` rule if you prefer Cursor's native rules.)

**Gemini CLI** — copy `AGENTS.md` to your project root, or append its contents to `~/.gemini/GEMINI.md` for a global rule. Keep `indie-app-shipping/references/**` alongside so the agent can open the detailed files.

### How to use it

Just work normally. When you say things like "scaffold a new reminder app", "write the App Store metadata for this", "check this against Play policy before I submit", or "should I keep investing in app X?", the agent pulls in the relevant part of the skill. You don't have to invoke it explicitly.

### Notes & disclaimer

- The templates in `assets/` are starting points, **not legal advice** — adapt to the data your app collects and to the laws that apply (e.g. Vietnam Decree 13/2023, GDPR). Keep store privacy declarations consistent with the app's real behavior.
- Store policies change. Verify time-sensitive gates (Play tester counts, Data safety questions, screenshot sizes, notarization tooling) in the consoles at submission time.

### License

MIT — see [LICENSE](LICENSE).

---

## Tiếng Việt

### Trong repo có gì

```
indie-app-shipping/            ← thư mục skill (copy cái này vào agent của bạn)
├── SKILL.md                   ← điều phối: chiến lược, workflow, quy tắc quyết định
├── references/
│   ├── shared/                ← signal-metrics, pricing-monetization
│   ├── ios/                   ← skeleton, metadata, screenshots, review-guidelines, review-notes, macos
│   └── android/               ← skeleton, metadata-aso, screenshots, play-policies, submission
└── assets/                    ← template pháp lý điền sẵn (privacy policy, EULA, trang xóa account)
AGENTS.md                      ← file vào chung cho nhiều tool (Cursor / Gemini / Antigravity / Claude Code)
install.sh                     ← script cài một lệnh cho mọi tool ở trên
```

Các file reference đều là Markdown thuần nên **nội dung dùng được cho mọi agent**. Khác nhau giữa các tool chỉ là *file entry* và *cách nạp*.

### Tương thích đa agent

| Tool | Định dạng | Đặt ở đâu | Cách nạp |
|---|---|---|---|
| **Claude Code** | Skill gốc | `~/.claude/skills/indie-app-shipping/` (global) hoặc `<project>/.claude/skills/indie-app-shipping/` | Tự động, khớp theo trường `description` |
| **Claude.ai / Cowork** | Upload file `.skill` | Settings → Capabilities → Skills | Tự động, theo description |
| **Google Antigravity** | Skill gốc (cùng định dạng `SKILL.md`) | `.agents/skills/indie-app-shipping/` (workspace) hoặc `~/.gemini/antigravity/skills/` (global) | Tự động, theo description |
| **Cursor** | `AGENTS.md` (hoặc `.cursor/rules/*.mdc`) | `AGENTS.md` ở gốc repo | Đọc lúc bắt đầu session |
| **Gemini CLI** | `AGENTS.md` (hoặc `GEMINI.md`) | `AGENTS.md` ở gốc repo, hoặc thêm vào `~/.gemini/GEMINI.md` | Luôn có trong context |

> **Tin tốt:** Claude và Antigravity dùng *chung một định dạng* skill (`SKILL.md` + `references/` + `assets/`, nạp on-demand theo description), nên thư mục skill gần như drop-in cho cả hai. Cursor và Gemini dùng file rules luôn-bật — với chúng, `AGENTS.md` là chuẩn chung và trỏ về cùng bộ file reference.

### Cài đặt

**Cài nhanh bằng script (khuyến nghị)** — file `install.sh` kèm theo sẽ copy skill vào đúng chỗ cho agent của bạn:

```bash
git clone https://github.com/cuongdev/indie-app-shipping.git
cd indie-app-shipping
chmod +x install.sh
./install.sh                  # menu tương tác — chọn agent
# hoặc chạy thẳng:
./install.sh claude           # Claude Code, global (~/.claude/skills)
./install.sh claude-project   # Claude Code, vào project bạn chọn
./install.sh antigravity      # Antigravity, global
./install.sh antigravity-ws   # Antigravity, vào workspace (.agents/skills)
./install.sh cursor           # ghi AGENTS.md (+ references) vào project
./install.sh gemini           # ghi AGENTS.md (+ references) vào project
```

Script hỏi xác nhận trước khi ghi đè bản cũ, và chạy được trên bash mặc định của macOS.

**Cài thủ công** — nếu muốn copy tay:

**Claude Code**
```bash
# global (dùng cho mọi project)
git clone https://github.com/cuongdev/indie-app-shipping.git
cp -r indie-app-shipping/indie-app-shipping ~/.claude/skills/
# hoặc theo từng project:
cp -r indie-app-shipping/indie-app-shipping <project>/.claude/skills/
```

**Claude.ai / Cowork** — đóng gói thư mục skill và upload file `.skill` ở Settings → Capabilities → Skills. (Có thể đóng gói bằng `package_skill.py` của Anthropic, hoặc zip thư mục `indie-app-shipping/` rồi đổi đuôi thành `.skill`.)

**Antigravity**
```bash
# theo workspace
cp -r indie-app-shipping/indie-app-shipping <workspace>/.agents/skills/
# hoặc global
cp -r indie-app-shipping/indie-app-shipping ~/.gemini/antigravity/skills/
```

**Cursor** — copy `AGENTS.md` vào gốc project. Cursor tự đọc. (Tùy chọn: chuyển thành rule `.cursor/rules/indie-app-shipping.mdc` nếu thích rules gốc của Cursor.)

**Gemini CLI** — copy `AGENTS.md` vào gốc project, hoặc thêm nội dung vào `~/.gemini/GEMINI.md` để thành rule global. Giữ `indie-app-shipping/references/**` bên cạnh để agent mở được file chi tiết.

### Dùng như thế nào

Cứ làm việc bình thường. Khi bạn nói kiểu "dựng skeleton cho app nhắc nhở mới", "viết metadata App Store cho app này", "soát app này theo policy Play trước khi submit", hay "có nên đầu tư tiếp vào app X không?", agent sẽ tự kéo phần liên quan của skill vào. Không cần gọi tên skill rõ ràng.

### Lưu ý & miễn trừ

- Template trong `assets/` chỉ là điểm khởi đầu, **không phải tư vấn pháp lý** — chỉnh theo dữ liệu app bạn thực sự thu thập và luật áp dụng (vd Nghị định 13/2023 của VN, GDPR). Khai báo privacy trên store phải khớp hành vi thật của app.
- Policy store thay đổi liên tục. Kiểm tra các mốc nhạy cảm (số tester của Play, câu hỏi Data safety, kích thước screenshot, công cụ notarization) trong console ngay lúc submit.

### Giấy phép

MIT — xem [LICENSE](LICENSE).
