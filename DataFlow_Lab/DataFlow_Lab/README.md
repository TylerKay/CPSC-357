# DataFlow Lab


### Summarize in your own words what is (or when to use) a @State, @Binding, @ObservedObject, @StateObject, and @environmentObject



- @State is used as a listener for when you want to store simple data types and update the view of that.
- @Binding is used when you want to change into subviews.
- @StateObject is used when you want to form a structure. If the object is the owner of the data, use StateObject.
- @ObservedObject is used when you want to form a structure. The reference of ObservedObject is not owned by the view, so there is a risk of the object being destroyed or reinitialized
- @environmentObject are used so that all child views can access it without needing to be passed from view to view.
    - This is most analogous to how Redux stores work in ReactJS. Redux is used to avoid prop drilling, passing child->child->child and then updating the parent by going back up the lateral chain. Same goes for environmentObject, except we are dealing with views instead of components. 
    
![Screenshot using Custom Environment Variables] (custom_environment_variables_screenshot.png)

![Screenshot using Environment Object] (environment_object_screenshot.png)

