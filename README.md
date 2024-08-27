# docker-practice-step0

[docker-practice](https://github.com/cnc4e/docker-practice)を実施するための環境を、
AWS上に構築するためのTerraformテンプレートです。

[terraform-practice ステップ1](https://github.com/cnc4e/terraform-practice/tree/main/step1-inital)を参照し、
Terraformの実行環境を準備してください。

# デプロイ方法
```
git clone http://S2211C12849-O1:8929/kuriyamotokenji/docker-practice-step0.git
cd docker-practice-step0
terraform init
terraform plan
terraform apply
```

# 後片付け
- terraform destoryします。