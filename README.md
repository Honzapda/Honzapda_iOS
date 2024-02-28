<div align="center">

  # Honzapda-iOS
  
  ![배너1](https://github.com/Honzapda/Honzapda_iOS/assets/80394340/ebfaf6cc-b916-4fbe-b796-9de0ca9cc955)
  <br><br>
  <img src="https://img.shields.io/badge/Xcode-15.2-blue?logo=Xcode"/>
  <img src="https://img.shields.io/badge/Swift-5.0-red?logo=swift"/>
  <img src="https://img.shields.io/badge/iOS-15.0+-black?logo=apple"/>

  <h4>혼잡다 Honzapda는 카페의 실시간 혼잡도 제공에 초점을 맞춘 카페 정보 제공 애플리케이션입니다.
  
</div>

<div align=center>

<br>

## 🍎 iOS Members 🍎
  
|[유진](https://github.com/youz2me)|[재용](https://github.com/AIsiteru98)|[영훈](https://github.com/0Hooni)|[주연](https://github.com/sedah2102)|
|:-----:|:-----:|:-----:|:-----:|
<img width="200px" src="https://avatars.githubusercontent.com/u/80394340?v=4"/> | <img width="200px" src="https://avatars.githubusercontent.com/u/132365672?v=4"/> | <img width="200px" src="https://avatars.githubusercontent.com/u/37678646?v=4"/> | <img width="200px" src="https://avatars.githubusercontent.com/u/108461678?v=4"/> |

<br>

</div>

## 📦 Development Environment 📦

### ⚒️ Xcode Environment

|종류|버전|
|:-----:|:-----:|
|**iOS 최소 지원 버전**|15.0+|
|**Xcode 버전**|15.2|

### 📚 Library Environment
|종류|설명|
|:-----:|:-----:|
|<p align="center">KingFisher|<p align="center">서버에서 이미지를 받아와 캐싱하는데 사용하는 라이브러리입니다.|
|<p align="center">Alamofire|<p align="center">서버와의 네트워킹 통신에 사용하는 라이브러리입니다.|
|<p align="center">SwiftLint|<p align="center">코드 컨벤션 유지를 위해 사용하는 라이브러리입니다.|

### 📁 Project Foldering 📁
```markdown
.swiftlint.yml
📁 Honzapda
├── 📁 Application
│   ├── HonzapdaApp
├── 📁 Global
|   ├── 🗂️ Protocols
|   ├── 🗂️ Privates
│   ├── 🗂️ Consts
│   ├── 🗂️ Extensions
│   ├── 🗂️ Resources
│   │   ├── 🗂️ Fonts
│   │   ├── Assets.xcassets
│   ├── 🗂️ Supporting Files
│   │   ├── 🗂️ Preview Content
│   │   ├── Info.plist
├── 📁 Network
│   ├── NetworkManager
│   ├── NetworkModel
│   ├── NetworkConstant
│   ├── 🗂️ Cafe
│   ├── 🗂️ Curation
│   ├── 🗂️ Home
│   ├── 🗂️ Onboarding
│   ├── 🗂️ Search
│   ├── 🗂️ User
│   │   ├── UserEntity
├── 📁 Presentation
│   ├── 🗂️ Cafe
│   ├── 🗂️ Curation
│   ├── 🗂️ Home
│   ├── 🗂️ Onboarding
│   ├── 🗂️ Search
│   ├── 🗂️ User
│   │   ├── 🗂️ Model
│   │   ├── 🗂️ View
│   │   ├── 🗂️ ViewModel
```


## 🤟 Project Convention 🤟

### 🔗 Git Convention 🔗
[Git-Flow 참고자료 (우아한 기술 블로그-우린 Git-flow를 사용하고 있어요)](https://techblog.woowahan.com/2553/)

🌊 모든 팀원은 Git-Flow 원칙에 따라 작업 시 이슈와 브랜치를 생성해야 합니다. 전체 작업 플로우는 다음과 같습니다.
```markdown
1. 작업할 Task에 대한 이슈를 작성
2. develop 브랜치 최신화 여부 확인 후 develop에서 분기하여 새 브랜치를 생성
   (브랜치명 설정 규칙은 Branch Convention 참고)
3. 분기된 브랜치에서 작업하며 주기적으로 커밋
   (마찬가지로 Commit Convention 참고)
4. 작업을 모두 마친 후 에러가 없는 상태에서 테스트 이후 원활하게 작동하는지 테스트
5. 원활한 작동 확인 후 PR 작성
```

<br>

### 💭 Tag Convention 💭

💬 작업 태그는 이슈와 커밋 메시지, 브랜치, PR 등에 사용합니다.<br>
💬 편의상 첫글자를 대문자로 시작하나, 사용 시 컨벤션에 맞게 소문자와 대문자에 유의해서 사용합니다.

|태그|사용하는 부분|
|:-----:|:-----:|
|Feat|기능 구현 시 사용합니다.|
|Design|UI 구현 시 사용합니다.|
|Chore|기능 구현 이외 코드를 수정하거나 내부 파일을 수정했을 때 사용합니다. (애매한 작업 포함)|
|Add|사진 등 에셋이나 라이브러리 추가 시 사용합니다.|
|Fix|버그나 오류 해결 시 사용합니다.|
|Docs|리드미, 템플릿 등 문서 수정 시 사용합니다. (swiftlint 포함)|
|Refactor|기존 코드를 성능 개선 등의 이유로 리팩토링했을 때 사용합니다.|
|Delete|기존 코드나 파일을 삭제했을 때 사용합니다.|
|Setting|프로젝트 관련 설정 변경 시 사용합니다.|


<br>

### 📣 Issue Convention 📣

🔊 이슈는 사전에 등록된 Issue Template에 따라 작성합니다. 다음 양식에 따라 작성합니다.<br>
⚠️ 이슈 생성 시 담당자와 라벨을 반드시 작업에 맞게 추가해주세요.
```Markdown
# 이슈 양식
[작업 태그] 작업 내용

# 올바른 이슈 이름 예시
- [Design] HomeView UI 구현

# 올바르지 않은 이슈 이름 예시
- [Design] HomeView 구현 (이슈 제목은 어떤 작업을 하는지 정확하게 명시해야 합니다.)
- HomeView UI 구현 (이슈 제목은 작업 태그를 포함해야 합니다.)
```
<br>

### 🖇️ Branch Convention 🖇️

📎 브랜치 네임은 작업 태그와 이슈 번호, 작업 내용을 모두 포함해야 합니다. 다음 양식에 따라 작성합니다.<br>
⚠️ 브랜치 네임은 모두 소문자로 작성되어야 합니다.
```Markdown
# 브랜치 네이밍 양식
작업 태그/이슈 번호-작업 내용

# 올바른 브랜치 네임 예시
- design/#1-mainview-ui

# 올바르지 않은 브랜치 네임 예시
- Design/#1-MainView-UI (브랜치 네임은 모두 소문자로 작성되어야 합니다.)
- Design/mainview-ui (브랜치 네임은 작업 태그를 포함해야 합니다.)
- Design:mainview-ui-#1 (브랜치 네임은 양식에 맞게 작성되어야 합니다.)
```

<br>

### ✅ Commit Convention ✅
✔️ 커밋 메시지는 작업 태그와 이슈 번호, 작업 내용을 모두 포함해야 합니다. 다음 양식에 따라 작성합니다.<br>
⚠️ 작업 태그의 첫 글자는 대문자로 작성되어야 합니다. 띄어쓰기에 유의합니다.
```Markdown
# 커밋 메시지 양식 
- 일반 작업 시
작업 태그: #이슈 번호 - 작업 이름

- Conflict를 해결할 시
Conflict: #이슈 번호 - Conflict 해결

- PR을 develop 브랜치에 머지할 시
기본 머지 메시지

- 내 브랜치에 develop을 머지할 시 (브랜치 최신화)
Merge: #이슈 번호 - Pull develop

# 커밋 메시지 예시
- 일반 작업 시
Feat: #1 - HomeView에서 HomeDetailView로 넘어가는 화면전환 구현

- Conflict 해결 시
Conflict: #1 - Conflict 해결

- PR을 develop 브랜치에 머지할 시
기본 머지 메시지

- 내 브랜치에 develop을 머지할 시 (브랜치 최신화)
Merge: #1 - Pull develop
```

<br>

### 🙏 PR & Review Convention 🙏
✍️ 미리 제공된 PR 템플릿에 따라 PR을 작성합니다. PR은 최대한 편하게 리뷰할 수 있도록 정리된 상태에서 & 코드 수가 너무 많지 않도록 해주세요. <br>
✍️ PR은 다른 팀원 두 명에게 Approve를 받아낸 후 머지가 가능합니다. <br>
✍️ 원칙적으로 본인은 자신의 PR을 머지할 수 없으며, 본인을 제외한 팀원이 머지를 진행합니다. <br>
✍️ 논의 사항(P1, P2)이나 수정 사항이 있을 경우 모두 반영하고 머지해주세요.

```markdown
# PR 이름 양식
[작업 태그] #이슈 번호 작업명

# PR 이름 예시
[Design] HomeView UI 구현 

# 코드 리뷰 양식
- 꼭 반영해야 하는 사항이 있을 경우
P1 : 내용

- 반영하면 좋을 것 같은 사항이 있을 경우
P2 : 내용

- 단순한 의견 제시일 경우
P3 : 내용
```