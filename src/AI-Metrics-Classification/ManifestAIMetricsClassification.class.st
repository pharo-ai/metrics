"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestAIMetricsClassification,
	#superclass : #PackageManifest,
	#category : #'AI-Metrics-Classification-Manifest'
}

{ #category : #'code-critics' }
ManifestAIMetricsClassification class >> ruleToDoRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#'AI-Metrics-Classification')) #'2022-03-24T11:06:06.679038+01:00') )
]
