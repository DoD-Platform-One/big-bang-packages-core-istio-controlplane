{{/*
Bigbang labels
*/}}
{{- define "bigbang.labels" -}}
{{- if .Chart.AppVersion }}
version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- end }}