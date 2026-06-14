# indie-app-shipping

[English](README.md) · **Tiếng Việt**

[![Stars](https://img.shields.io/github/stars/cuongdev/indie-app-shipping?style=flat&logo=github)](https://github.com/cuongdev/indie-app-shipping/stargazers)
[![Forks](https://img.shields.io/github/forks/cuongdev/indie-app-shipping?style=flat&logo=github)](https://github.com/cuongdev/indie-app-shipping/network/members)
[![Issues](https://img.shields.io/github/issues/cuongdev/indie-app-shipping)](https://github.com/cuongdev/indie-app-shipping/issues)
[![License: MIT](https://img.shields.io/github/license/cuongdev/indie-app-shipping)](LICENSE)
[![Last commit](https://img.shields.io/github/last-commit/cuongdev/indie-app-shipping)](https://github.com/cuongdev/indie-app-shipping/commits/main)

> Bộ playbook cho solo/indie dev: ship app nhỏ iOS/macOS & Android thật nhanh, đo nhu cầu thật, và chỉ đào sâu những app có tín hiệu.

Đây là một **skill/rules pack cho AI agent**, không phải app. Nó dạy agent quy trình lặp lại để ship app nhỏ: skeleton chuẩn, metadata & ASO, screenshot, checklist tuân thủ Apple/Google, review note, pricing, và cách quyết định app nào đáng đầu tư dựa trên tín hiệu.

## Trong repo có gì

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

## Tương thích đa agent

| Tool | Định dạng | Đặt ở đâu | Cách nạp |
|---|---|---|---|
| **Claude Code** | Skill gốc | `~/.claude/skills/indie-app-shipping/` (global) hoặc `<project>/.claude/skills/indie-app-shipping/` | Tự động, khớp theo trường `description` |
| **Claude.ai / Cowork** | Upload file `.skill` | Settings → Capabilities → Skills | Tự động, theo description |
| **Google Antigravity** | Skill gốc (cùng định dạng `SKILL.md`) | `.agents/skills/indie-app-shipping/` (workspace) hoặc `~/.gemini/antigravity/skills/` (global) | Tự động, theo description |
| **Cursor** | `AGENTS.md` (hoặc `.cursor/rules/*.mdc`) | `AGENTS.md` ở gốc repo | Đọc lúc bắt đầu session |
| **Gemini CLI** | `AGENTS.md` (hoặc `GEMINI.md`) | `AGENTS.md` ở gốc repo, hoặc thêm vào `~/.gemini/GEMINI.md` | Luôn có trong context |

> **Tin tốt:** Claude và Antigravity dùng *chung một định dạng* skill (`SKILL.md` + `references/` + `assets/`, nạp on-demand theo description), nên thư mục skill gần như drop-in cho cả hai. Cursor và Gemini dùng file rules luôn-bật — với chúng, `AGENTS.md` là chuẩn chung và trỏ về cùng bộ file reference.

## Cài đặt

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

## Dùng như thế nào

Cứ làm việc bình thường. Khi bạn nói kiểu "dựng skeleton cho app nhắc nhở mới", "viết metadata App Store cho app này", "soát app này theo policy Play trước khi submit", hay "có nên đầu tư tiếp vào app X không?", agent sẽ tự kéo phần liên quan của skill vào. Không cần gọi tên skill rõ ràng.

## Lưu ý & miễn trừ

- Template trong `assets/` chỉ là điểm khởi đầu, **không phải tư vấn pháp lý** — chỉnh theo dữ liệu app bạn thực sự thu thập và luật áp dụng (vd Nghị định 13/2023 của VN, GDPR). Khai báo privacy trên store phải khớp hành vi thật của app.
- Policy store thay đổi liên tục. Kiểm tra các mốc nhạy cảm (số tester của Play, câu hỏi Data safety, kích thước screenshot, công cụ notarization) trong console ngay lúc submit.

## Giấy phép

MIT — xem [LICENSE](LICENSE).

## Lịch sử Star

Nếu playbook này giúp bạn tiết kiệm thời gian, một ⭐ sẽ giúp người khác tìm thấy nó. Biểu đồ dưới đây theo dõi số star theo thời gian.

[![Star History Chart](https://api.star-history.com/svg?repos=cuongdev/indie-app-shipping&type=Date)](https://star-history.com/#cuongdev/indie-app-shipping&Date)
