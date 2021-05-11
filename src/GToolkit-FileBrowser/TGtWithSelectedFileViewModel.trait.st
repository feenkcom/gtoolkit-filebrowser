Trait {
	#name : #TGtWithSelectedFileViewModel,
	#instVars : [
		'selectedFileViewModel'
	],
	#category : #'GToolkit-FileBrowser-Support'
}

{ #category : #'api - selected file view model' }
TGtWithSelectedFileViewModel >> deselectFileViewModel [
	<propertyUnsetter: #selectedFileViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyUnsetterTemplate'>
	| aPreviousSelectedFileViewModel |

	self hasSelectedFileViewModel
		ifFalse: [ ^ self ].

	aPreviousSelectedFileViewModel := selectedFileViewModel.
	selectedFileViewModel := nil.
	self onPreviousSelectedFileViewModelUnset: aPreviousSelectedFileViewModel.
	self notifySelectedFileViewModelChanged
]

{ #category : #'api - selected file view model' }
TGtWithSelectedFileViewModel >> hasSelectedFileViewModel [
	<return: #Boolean>
	<propertyTester: #selectedFileViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyTesterTemplate'>

	^ selectedFileViewModel notNil
]

{ #category : #'api - selected file view model' }
TGtWithSelectedFileViewModel >> notifySelectedFileViewModelChanged [
	"Override this notify method to announce changes to the property"
	<propertyChangeNotifier: #selectedFileViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#notifyPropertyChangedTemplate'>
]

{ #category : #'api - selected file view model' }
TGtWithSelectedFileViewModel >> onNewSelectedFileViewModelSet: aNewSelectedFileViewModel [
	"Is sent after a new value of the selectedFileViewModel is assigned"
	<propertySetHook: #selectedFileViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onNewPropertySetHookTemplate'>
]

{ #category : #'api - selected file view model' }
TGtWithSelectedFileViewModel >> onPreviousSelectedFileViewModelUnset: aPreviousSelectedFileViewModel [
	"Is sent after a previous value of the selectedFileViewModel is de-assigned"
	<propertyUnsetHook: #selectedFileViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onPreviousPropertyUnsetHookTemplate'>
]

{ #category : #'api - selected file view model' }
TGtWithSelectedFileViewModel >> selectFileViewModel: aNewSelectedFileViewModel [
	<propertySetter: #selectedFileViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertySetterTemplate'>

	(self hasSelectedFileViewModel
		and: [ self selectedFileViewModel = aNewSelectedFileViewModel ])
			ifTrue: [ ^ self ].
	
	self hasSelectedFileViewModel
		ifTrue: [
			| aPreviousSelectedFileViewModel |
			aPreviousSelectedFileViewModel := selectedFileViewModel.
			selectedFileViewModel := nil.
			self onPreviousSelectedFileViewModelUnset: aPreviousSelectedFileViewModel ].
	selectedFileViewModel := aNewSelectedFileViewModel.
	self onNewSelectedFileViewModelSet: aNewSelectedFileViewModel.
	self notifySelectedFileViewModelChanged
]

{ #category : #'api - selected file view model' }
TGtWithSelectedFileViewModel >> selectedFileViewModel [
	<return: #GtFileBrowserFileViewModel>
	<propertyGetter: #selectedFileViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyGetterTemplate'>

	^ selectedFileViewModel
]
