so terraform ek software h jo ki hume infractre baname help karta h

![alt text](image.png)

so aise tum click hi karte reh jaoge 

![alt text](image-1.png)

so terraform se tum ek simple code likh skate ho jise terrafom padega aur woh aws ya phir kisis bhi provider se baat karega aur infrastructure is ready

![alt text](image-2.png)

## main.tf

so ise hum hcl m likete h 

![alt text](image-3.png)

## terraform

so terraform ek just engine h jo ki main.tf ko read karta h aur deicde karta h kya banaa h infrastructure

![alt text](image-4.png)

## provider

![alt text](image-5.png)

# cloud 

![alt text](image-6.png)

## code

```
terraform {
  required_providers {
  local = {
    source = "hashicorp/local"
    version = "~> 2.5"
  }
}

}

```

so ye code teraform ko batata h ki kya requirment chaiye use run karne se phel like idhar hun local provider liya h so pehel ye local provider downlod karega like that 


so ise run kanr ke liye tum

ye cmd use kr sakte ho

terraform init

so ye nmp install ke jaisa hi h

![alt text](image-7.png)


## terraform workflow
![alt text](image-8.png)

## terraform init

so this is used to prepare the project like npm init so woh sab package json lata h ye bhi .teraform .terraform.lock.hcl create karta h

aur infrasture bhi download karta h

## terraform plan

so ye most important cmd h

so ye batata h agr humen terraform apply kiya toh kya hoga like plan explain karta h infrastructe m koi change nahi karta h but ye batata h ki kya hoga infracsture m jb hum run karege apne code ko 

![alt text](image-9.png)

## terraform apply

so is cmd se humara terraform actally provider se baat karta h jise infrastructure  banta h 

![alt text](image-10.png)

## terraform destroy

![alt text](image-11.png)


## resouces

so hume pata h terraform infracture banta h but use pata kaise chalta h kya baan so use resource keyword se pata chalta h

so the code look like this

resouce keyword h jo ki use hot h infrastructre define karne ke liye

```
resource "aws_s3_buckek" "images"

```

![alt text](image-12.png)


## varible 

so dyncmic data ke liye varible use karte h terraform me

```
variable "filename" {
  default = "hello.txt"
}

resource "local_file" "hello" {
  filename = var.filename
  content  = "Hello Terraform!"
}

```

## outputs

so tume kuch output chaiye terraform se toh tum outputs use kar skate ho so think of this like return or print statemts

so output kar use akrste h hum public ip pane ke liye o newy crearted ho

```
output "public_ip" {
  value = aws_instance.web.public_ip
}

```

## Modules
modules toh simply progremaing wala h jisme hum diffrnet features wah phri woh fucntion jsi hum bar bar use karna chate h use diffrnt file me daal dete the phir use main file se call kr dete the 

![alt text](image-13.png)

![alt text](image-14.png)

![alt text](image-15.png)
