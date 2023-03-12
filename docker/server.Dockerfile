# Dcokerfile
# 컨테이너 기본 이미지
FROM node:18.15.0

# Dockerfile 을 생성한 사람
MAINTAINER Kevin Lee <kw.lee@teamsparta.co>

# Working directory /app 생성
RUN mkdir -p /app

# Working directory /app 으로 지정
WORKDIR /app

# package.json 과 package-lock.json을 복사
COPY package*.json .
COPY tsconfig.json .
COPY src/ ./src/

# 의존성 설치 및 build
RUN npm install && npm run build

# 오픈할 포트를 지정
EXPOSE 9999

# 컨테이너에서 실행될 명령어
CMD [ "npm", "run", "start" ]