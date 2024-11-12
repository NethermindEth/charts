{{/*
    ====== Basic ======
*/}}

{{- define "dlcbtc.namespace" -}}
{{- default .Release.Namespace -}}
{{- end -}}

{{- define "dlcbtc.release" -}}
{{- default .Release.Name -}}
{{- end -}}

{{- define "dlcbtc.name" -}}
{{- printf "%s-%s" .Chart.Name .Release.Name | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "dlcbtc.names.chartWithoutVersion" -}}
{{- printf "%s" .Chart.Name | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "dlcbtc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
    ====== Labels ======
*/}}

{{- define "dlcbtc.metaLabels" -}}
app.kubernetes.io/name: {{ template "dlcbtc.name" . }}
helm.sh/chart: {{ include "dlcbtc.names.chartWithoutVersion" . }}
app.kubernetes.io/managed-by: "{{ .Release.Service }}"
{{- range $key, $value := .Values.global.extraLabels }}
{{ $key }}: {{ include "dlcbtc.renderTpl" (dict "value" $value "context" $) | quote }}
{{- end }}
{{- end -}}

{{- define "dlcbtc.matchLabels" -}}
app.kubernetes.io/name: {{ template "dlcbtc.name" . }}
helm.sh/chart: {{ include "dlcbtc.names.chartWithoutVersion" . }}
app.kubernetes.io/managed-by: "{{ .Release.Service }}"
{{- range $key, $value := .Values.global.extraMatchLabels }}
{{ $key }}: {{ include "dlcbtc.renderTplMatchLables" (dict "value" $value "context" $) | quote }}
{{- end }}
{{- end -}}

{{- define "dlcbtc.statefulset" -}}
app.kubernetes.io/name: {{ template "dlcbtc.name" . }}
helm.sh/chart: {{ include "dlcbtc.names.chartWithoutVersion" . }}
app.kubernetes.io/managed-by: "{{ .Release.Service }}"
{{- range $key, $value := .Values.global.extraLabels }}
{{ $key }}: {{ include "dlcbtc.renderTplStatefulset" (dict "value" $value "context" $) | quote }}
{{- end }}
{{- end -}}

{{- define "dlcbtc.renderTpl"  -}}
    {{- if typeIs "string" .value }}
{{- tpl .value .context }}
    {{- else }}
{{- tpl (.value | toYaml) .context }}
    {{- end }}
{{- end -}}

{{- define "dlcbtc.renderTplMatchLables"  -}}
    {{- if typeIs "string" .value }}
{{- tpl .value .context }}
    {{- else }}
{{- tpl (.value | toYaml) .context }}
    {{- end }}
{{- end -}}

{{- define "dlcbtc.renderTplStatefulset"  -}}
    {{- if typeIs "string" .value }}
{{- tpl .value .context }}
    {{- else }}
{{- tpl (.value | toYaml) .context }}
    {{- end }}
{{- end -}}