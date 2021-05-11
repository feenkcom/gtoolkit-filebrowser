Trait {
	#name : #TGtWithSelectedFolderViewModel,
	#instVars : [
		'selectedFolderViewModel'
	],
	#category : #'GToolkit-FileBrowser-Support'
}

{ #category : #'api - selected folder view model' }
TGtWithSelectedFolderViewModel >> deselectFolderViewModel [
	<propertyUnsetter: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyUnsetterTemplate'>
	| aPreviousSelectedFolderViewModel |

	self hasSelectedFolderViewModel
		ifFalse: [ ^ self ].

	aPreviousSelectedFolderViewModel := selectedFolderViewModel.
	selectedFolderViewModel := nil.
	self onPreviousSelectedFolderViewModelUnset: aPreviousSelectedFolderViewModel.
	self notifySelectedFolderViewModelChanged
]

{ #category : #'api - selected folder view model' }
TGtWithSelectedFolderViewModel >> hasSelectedFolderViewModel [
	<return: #Boolean>
	<propertyTester: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyTesterTemplate'>

	^ selectedFolderViewModel notNil
]

{ #category : #'api - selected folder view model' }
TGtWithSelectedFolderViewModel >> notifySelectedFolderViewModelChanged [
	"Override this notify method to announce changes to the property"
	<propertyChangeNotifier: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#notifyPropertyChangedTemplate'>
]

{ #category : #'api - selected folder view model' }
TGtWithSelectedFolderViewModel >> onNewSelectedFolderViewModelSet: aNewSelectedFolderViewModel [
	"Is sent after a new value of the selectedFolderViewModel is assigned"
	<propertySetHook: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onNewPropertySetHookTemplate'>
]

{ #category : #'api - selected folder view model' }
TGtWithSelectedFolderViewModel >> onPreviousSelectedFolderViewModelUnset: aPreviousSelectedFolderViewModel [
	"Is sent after a previous value of the selectedFolderViewModel is de-assigned"
	<propertyUnsetHook: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#onPreviousPropertyUnsetHookTemplate'>
]

{ #category : #'api - selected folder view model' }
TGtWithSelectedFolderViewModel >> selectFolderViewModel: aNewSelectedFolderViewModel [
	<propertySetter: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertySetterTemplate'>

	(self hasSelectedFolderViewModel
		and: [ self selectedFolderViewModel = aNewSelectedFolderViewModel ])
			ifTrue: [ ^ self ].
	
	self hasSelectedFolderViewModel
		ifTrue: [
			| aPreviousSelectedFolderViewModel |
			aPreviousSelectedFolderViewModel := selectedFolderViewModel.
			selectedFolderViewModel := nil.
			self onPreviousSelectedFolderViewModelUnset: aPreviousSelectedFolderViewModel ].
	selectedFolderViewModel := aNewSelectedFolderViewModel.
	self onNewSelectedFolderViewModelSet: aNewSelectedFolderViewModel.
	self notifySelectedFolderViewModelChanged
]

{ #category : #'api - selected folder view model' }
TGtWithSelectedFolderViewModel >> selectedFolderViewModel [
	<return: #GtFileBrowserFolderViewModel>
	<propertyGetter: #selectedFolderViewModel>
	<generatedFrom: #'TGtRobocoderWithPropertyTraitTemplate>>#propertyGetterTemplate'>

	^ selectedFolderViewModel
]
