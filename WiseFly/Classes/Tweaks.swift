import Foundation

class Tweaks: NSObject, FBTweakObserver {
  
  typealias ActionWithValue = ((currentValue: AnyObject) -> ())
  var actionsWithValue = [String:ActionWithValue]()
  
  //1
  class func collectionWithName(collectionName: String, categoryName: String) -> FBTweakCollection {
    let store = FBTweakStore.sharedInstance()
    
    var category = store.tweakCategoryWithName(categoryName)
    if category == nil {
      category = FBTweakCategory(name: categoryName)
      store.addTweakCategory(category)
    }
    
    var collection = category.tweakCollectionWithName(collectionName)
    if collection == nil {
      collection = FBTweakCollection(name: collectionName)
      category.addTweakCollection(collection)
    }
    return collection
  }
  
  //2
  class func tweakValueForCategory<T:AnyObject>(categoryName: String, collectionName: String, name: String, defaultValue: T, minimumValue: T? = nil, maximumValue: T? = nil) -> T {
    #if DEBUG
    let identifier = categoryName.lowercaseString + "." + collectionName.lowercaseString + "." + name
    
    let collection = collectionWithName(collectionName, categoryName: categoryName)
    
    var tweak = collection.tweakWithIdentifier(identifier)
    if tweak == nil {
      tweak = FBTweak(identifier: identifier)
      tweak.name = name
      tweak.defaultValue = defaultValue
      
      if minimumValue != nil && maximumValue != nil {
        tweak.minimumValue = minimumValue
        tweak.maximumValue = maximumValue
      }
      
      collection.addTweak(tweak)
    }
    
    return (tweak.currentValue ?? tweak.defaultValue) as! T
    #else
    return defaultValue
    #endif
  }
  
  func tweakActionForCategory<T where T: AnyObject>(categoryName: String, collectionName: String, name: String, defaultValue: T, minimumValue: T? = nil, maximumValue: T? = nil, action: (currentValue: AnyObject) -> ()) {
    #if DEBUG
    let identifier = categoryName.lowercaseString + "." + collectionName.lowercaseString + "." + name
    
    let collection = Tweaks.collectionWithName(collectionName, categoryName: categoryName)
    
    var tweak = collection.tweakWithIdentifier(identifier)
    if tweak == nil {
      tweak = FBTweak(identifier: identifier)
      tweak.name = name
      
      tweak.defaultValue = defaultValue
      
      if minimumValue != nil && maximumValue != nil {
        tweak.minimumValue = minimumValue
        tweak.maximumValue = maximumValue
      }
      tweak.addObserver(self)
      
      collection.addTweak(tweak)
    }
    
    actionsWithValue[identifier] = action
    
    action(currentValue: tweak.currentValue ?? tweak.defaultValue)
    #else
    action(currentValue: defaultValue)
    #endif
  }
  
  func tweakDidChange(tweak: FBTweak!) {
    let action = actionsWithValue[tweak.identifier]
    action?(currentValue: tweak.currentValue ??  tweak.defaultValue)
  }
}