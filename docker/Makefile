#!make
# proxy는 nginx를 의미.

# 변수 설정
ECR             := 497217256558.dkr.ecr.ap-northeast-1.amazonaws.com
ECR_URI_PROXY   := ${ECR_URI}/onboarding-nginx-kw
ECR_URI_SERVER  := ${ECR_URI}/onboarding-backend-kw

# 빌드 명령
build:
    docker build -f _proxy.Dockerfile -t ${ECR_URI_PROXY} .;
    docker build -f _server.Dockerfile -t ${ECR_URI_SERVER} ../;

# push(ecr에 도커이미지 push) 명령
push:
	@aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 497217256558.dkr.ecr.ap-northeast-1.amazonaws.com
	@docker push ${ECR_IMG_COMMIT_SERVER}
	@docker push ${ECR_IMG_LATEST_SERVER}
	@docker push ${ECR_IMG_COMMIT_PROXY}
	@docker push ${ECR_IMG_LATEST_PROXY}