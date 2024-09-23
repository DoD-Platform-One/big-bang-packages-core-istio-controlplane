#!/bin/sh
wait_project() {
   timeElapsed=0
   while true; do
      istioStatus=$(kubectl get istiooperators -A -o jsonpath='{.items[0].status.status}' | xargs)
      if [[ $istioStatus == "HEALTHY" ]]; then
         break
      fi
      sleep 5
      timeElapsed=$(($timeElapsed+5))
      if [[ $timeElapsed -ge 600 ]]; then
         exit 1
      fi
   done
}
