kubectl rollout restart deployment config-server -n pricing-tool-int
kubectl rollout restart deployment eureka-server -n pricing-tool-int
kubectl rollout restart deployment zuul-server -n pricing-tool-int
kubectl rollout restart deployment auth-server -n pricing-tool-int