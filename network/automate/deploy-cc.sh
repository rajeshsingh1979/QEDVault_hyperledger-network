channel_name=$1
cc_name=$2
cc_version=$3

deploy_sequence=$4

. ./scripts/set-channel.sh $channel_name
. ./scripts/set-cc.sh $cc_name $cc_version



org_name=admin

. ./scripts/set-org.sh $org_name
./scripts/cc-package.sh $org_name $cc_name $cc_version
./scripts/cc-install.sh $cc_name $cc_version $org_name
./scripts/cc-queryinstalled.sh  $org_name $cc_name $cc_version
./scripts/cc-approve.sh $deploy_sequence
./scripts/cc-checkreadyness.sh $channel_name $org_name $cc_name $cc_version $deploy_sequence


# ==========================================================================================
org_name=manufacturer

. ./scripts/set-org.sh $org_name
./scripts/cc-package.sh $org_name $cc_name $cc_version
./scripts/cc-install.sh $cc_name $cc_version $org_name
./scripts/cc-queryinstalled.sh  $org_name $cc_name $cc_version
./scripts/cc-approve.sh $deploy_sequence
./scripts/cc-checkreadyness.sh $channel_name $org_name $cc_name $cc_version $deploy_sequence

# ==========================================================================================
org_name=consumer

. ./scripts/set-org.sh $org_name
./scripts/cc-package.sh $org_name $cc_name $cc_version
./scripts/cc-install.sh $cc_name $cc_version $org_name
./scripts/cc-queryinstalled.sh  $org_name $cc_name $cc_version
./scripts/cc-approve.sh $deploy_sequence
./scripts/cc-checkreadyness.sh $channel_name $org_name $cc_name $cc_version $deploy_sequence

# ==========================================================================================



./scripts/cc-commit.sh admin $deploy_sequence manufacturer consumer
./scripts/cc-querycommitted.sh $channel_name $org_name $cc_name





