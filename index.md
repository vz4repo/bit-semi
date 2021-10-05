# 가제:여행길

### 개발환경
```
IDE: 이클립스(21-06)
WAS: TOMCAT9
DB: MYSQL
VC: git
```
## 대략적인 레이아웃..
### 0. index 화면, main 화면
> index : 첫 화면
> main : 가장 위에 nav, banner가 있는 화면
> 명예의 전당: 별점 상위권..계획?후기??
> 이번 주 상위..계획?후기??
> 정렬 :  조회수, 별점
### 1. 회원가입
```
id
pw
name
phone
email
addr: 지역별 추천
sex: 성별 추천
age: 연령대별 추천
```
```
가입 기능
취소 기능: index 화면으로
기타 SNS 로그인 연동 기능?
```
### 2. 여행계획
> 지도에 출발지, 경유지, 도착지 마커를 따라 선으로 이어진 경로 표시
> 1일 단위 기록
> 1시간 단위 기록
```
출발지
경유지
도착지
계획 추천
계획 비추천
계획 찜
```
```
댓글 기능
신고(쪽지) 기능
수정 기능
삭제 기능
조회수 기능
팔로우 기능
```
### 3. 계획후기
> 해당 계획의 후기
> 여행 사진 최소 1장 업로드 필수. 5장까지 업로드 가능
> 후기를 남겨야 해당 계획에 별점 등록 가능
```
후기 추천
후기 비추천
여행 계획 별점
```
```
후기 수정 기능
후기 삭제 기능
```
### 4. 마이페이지
```
회원 정보 수정 기능
'내 계획' 리스트 기능
'내 후기' 리스트 기능
'내 댓글' 리스트 기능
'내 팔로잉' 리스트 출력: 프로필 클릭 시 계획/후기 리스트 기능?
'내 찜' 리스트 기능
'신고함/신고쪽지' 리스트 기능(관리자 계정 전용)
```




## Welcome to GitHub Pages

You can use the [editor on GitHub](https://github.com/vz4repo/bit-semi/edit/gh-pages/index.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.


### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/vz4repo/bit-semi/settings/pages). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://support.github.com/contact) and we’ll help you sort it out.