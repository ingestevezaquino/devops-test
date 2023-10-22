## GET SERVICE ACCOUNT TOKEN:

# kubectl get serviceaccount <serviceaccount_name> -o jsonpath='{.secrets[0].name}'

# kubectl get secret <secret_name> -o jsonpath='{.data.token}' | base64 --decode
