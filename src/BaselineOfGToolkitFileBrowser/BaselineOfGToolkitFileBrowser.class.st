Class {
	#name : #BaselineOfGToolkitFileBrowser,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitFileBrowser
}

{ #category : #baseline }
BaselineOfGToolkitFileBrowser >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'GToolkitInspector' with: [
				spec repository: 'github://feenkcom/gtoolkit-inspector:v0.8.470/src' ];
			baseline: 'GToolkitPhlow' with: [
				spec repository: 'github://feenkcom/gtoolkit-phlow:v0.8.378/src' ];
			baseline: 'GToolkitSpotter' with: [
				spec repository: 'github://feenkcom/gtoolkit-spotter:v0.8.364/src' ].
		spec package: 'GToolkit-FileBrowser' with: [
				spec requires: #('GToolkitInspector' 'GToolkitPhlow' 'GToolkitSpotter' ). ]. ].

]
