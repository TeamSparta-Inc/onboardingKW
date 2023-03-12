#!make
# proxy는 nginx를 의미.

# 변수 설정
ECR             := 497217256558.dkr.ecr.ap-northeast-1.amazonaws.com
ECR_URI_PROXY   := ${ECR}/onboarding-nginx-kw
ECR_URI_SERVER  := ${ECR}/onboarding-backend-kw

# 빌드 명령
build:
	docker build -f _proxy.Dockerfile -t ${ECR_URI_PROXY} .;
	docker build -f _server.Dockerfile -t ${ECR_URI_SERVER} ../;

# push(ecr에 도커이미지 push) 명령
push:
	@aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin ${ECR}
	@docker push ${ECR_URI_PROXY}
	@docker push ${ECR_URI_SERVER}
