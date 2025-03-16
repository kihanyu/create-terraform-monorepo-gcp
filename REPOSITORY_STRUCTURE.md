# Repository Structure

```javascript
gcp-terraform-modules/
│
├── .github/
│   └── workflows/
│       ├── module-validate.yml
│       └── module-publish.yml
│
├── modules/
│   ├── network/
│   │   ├── vpc/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   ├── outputs.tf
│   │   │   └── versions.tf
│   │   │
│   │   ├── firewall/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   ├── outputs.tf
│   │   │   └── versions.tf
│   │   │
│   │   ├── dns/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   ├── outputs.tf
│   │   │   └── versions.tf
│   │   │
│   │   └── peering/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       ├── outputs.tf
│   │       └── versions.tf
│   │
│   ├── compute/
│   │   ├── gce/
│   │   │   ├── instance/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   └── versions.tf
│   │   │   │
│   │   │   ├── instance-template/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   └── versions.tf
│   │   │   │
│   │   │   └── managed-instance-group/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       ├── outputs.tf
│   │   │       └── versions.tf
│   │   │
│   │   ├── gke/
│   │   │   ├── cluster/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   └── versions.tf
│   │   │   │
│   │   │   └── nodepool/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       ├── outputs.tf
│   │   │       └── versions.tf
│   │   │
│   │   └── cloud-run/
│   │       ├── service/
│   │       │   ├── main.tf
│   │       │   ├── variables.tf
│   │       │   ├── outputs.tf
│   │       │   └── versions.tf
│   │       │
│   │       └── domain-mapping/
│   │           ├── main.tf
│   │           ├── variables.tf
│   │           ├── outputs.tf
│   │           └── versions.tf
│   │
│   ├── databases/
│   │   ├── cloud-sql/
│   │   │   ├── mysql/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   └── versions.tf
│   │   │   │
│   │   │   ├── postgres/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   └── versions.tf
│   │   │   │
│   │   │   └── sqlserver/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       ├── outputs.tf
│   │   │       └── versions.tf
│   │   │
│   │   ├── firestore/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   ├── outputs.tf
│   │   │   └── versions.tf
│   │   │
│   │   ├── memorystore/
│   │   │   ├── redis/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   └── versions.tf
│   │   │   │
│   │   │   └── memcached/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       ├── outputs.tf
│   │   │       └── versions.tf
│   │   │
│   │   └── bigtable/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       ├── outputs.tf
│   │       └── versions.tf
│   │
│   ├── storage/
│   │   ├── gcs/
│   │   │   ├── bucket/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   └── versions.tf
│   │   │   │
│   │   │   └── bucket-iam/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       ├── outputs.tf
│   │   │       └── versions.tf
│   │   │
│   │   └── filestore/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       ├── outputs.tf
│   │       └── versions.tf
│   │
│   ├── security/
│   │   ├── iam/
│   │   │   ├── service-account/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   └── versions.tf
│   │   │   │
│   │   │   ├── roles/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   └── versions.tf
│   │   │   │
│   │   │   └── workload-identity/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       ├── outputs.tf
│   │   │       └── versions.tf
│   │   │
│   │   ├── secret-manager/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   ├── outputs.tf
│   │   │   └── versions.tf
│   │   │
│   │   ├── kms/
│   │   │   ├── keyring/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   └── versions.tf
│   │   │   │
│   │   │   └── crypto-key/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       ├── outputs.tf
│   │   │       └── versions.tf
│   │   │
│   │   └── vpc-service-controls/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       ├── outputs.tf
│   │       └── versions.tf
│   │
│   ├── monitoring/
│   │   ├── cloud-monitoring/
│   │   │   ├── dashboards/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   └── versions.tf
│   │   │   │
│   │   │   ├── alerts/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   └── versions.tf
│   │   │   │
│   │   │   └── uptime-checks/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       ├── outputs.tf
│   │   │       └── versions.tf
│   │   │
│   │   ├── logging/
│   │   │   ├── log-sink/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   └── versions.tf
│   │   │   │
│   │   │   └── log-metric/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       ├── outputs.tf
│   │   │       └── versions.tf
│   │   │
│   │   └── trace/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       ├── outputs.tf
│   │       └── versions.tf
│   │
│   ├── messaging/
│   │   ├── pubsub/
│   │   │   ├── topic/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   └── versions.tf
│   │   │   │
│   │   │   └── subscription/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       ├── outputs.tf
│   │   │       └── versions.tf
│   │   │
│   │   └── eventarc/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       ├── outputs.tf
│   │       └── versions.tf
│   │
│   ├── ai-ml/
│   │   ├── vertex-ai/
│   │   │   ├── workbench/
│   │   │   │   ├── main.tf
│   │   │   │   ├── variables.tf
│   │   │   │   ├── outputs.tf
│   │   │   │   └── versions.tf
│   │   │   │
│   │   │   └── dataset/
│   │   │       ├── main.tf
│   │   │       ├── variables.tf
│   │   │       ├── outputs.tf
│   │   │       └── versions.tf
│   │   │
│   │   └── automl/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       ├── outputs.tf
│   │       └── versions.tf
│   │
│   └── hybrid-cloud/
│       ├── anthos/
│       │   ├── cluster/
│       │   │   ├── main.tf
│       │   │   ├── variables.tf
│       │   │   ├── outputs.tf
│       │   │   └── versions.tf
│       │   │
│       │   └── config-management/
│       │       ├── main.tf
│       │       ├── variables.tf
│       │       ├── outputs.tf
│       │       └── versions.tf
│       │
│       └── interconnect/
│           ├── main.tf
│           ├── variables.tf
│           ├── outputs.tf
│           └── versions.tf
│
├── scripts/
│   ├── module-validate.sh
│   ├── module-publish.sh
│   └── generate-docs.py
│
├── examples/
│   ├── network/
│   │   ├── example-vpc.tf
│   │   └── ...
│   ├── compute/
│   │   ├── example-instance.tf
│   │   └── ...
│   ├── ai-ml/
│   │   ├── example-workbench.tf
│   │   └── ...
│   └── ... (examples for each module category)
│
├── tests/
│   ├── network/
│   │   ├── test-vpc.tf
│   │   └── ...
│   ├── compute/
│   │   ├── test-instance.tf
│   │   └── ...
│   └── ... (module-specific tests)
│
├── .tflint.hcl
├── .terrascan.yaml
├── renovate.json
├── CONTRIBUTING.md
├── LICENSE
└── README.md
```
