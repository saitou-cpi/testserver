"# testserver" 

## 成果物
* VPC
* subnet
* roottable
* internet gateway
* EC2
* security group(for EC2)
* security group(for RDS)

## 使う前に
terraformを実行する前に、"terraform.tfvars"を編集する。

```yaml
project = "your project name" # あなたのプロジェクト名
user    = "your name" # あなたのユーザー名
myip    = "your ip address" # あなたのローカル環境のIPアドレス
region  = "ap-southeast-1" # デプロイしたいリージョン
az_1a   = "ap-southeast-1a" # デプロイしたいひとつめのAZ
az_1c   = "ap-southeast-1c" # デプロイしたいふたつめのAZ
keypair = "your keyname" # EC2インスタンスに利用するキーペア名
```

### 事前準備
・terraformをセットアップ
・デプロイ先リージョンにキーペアを作成しておきましょう。
