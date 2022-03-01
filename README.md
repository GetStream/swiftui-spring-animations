# Swiftui Spring Animations
This repository serves as a reference for SwiftUI Spring Animations. It demonstrates use cases for the various types of spring animations as well as parameters. No more guessing the values for the parameters of spring animations you create for your next iOS app. 


![HSwiftUI spring animation parameters ](https://github.com/GetStream/swiftui-spring-animations/blob/main/Misc/springParameters.svg)


## Chained Spring: <a href="https://github.com/GetStream/swiftui-spring-animations/blob/main/SwiftUISpringAnimations/Introduction/ChainedSpring.swift"> Swift file</a>
![Chained Spring ](https://github.com/GetStream/swiftui-spring-animations/blob/main/Misc/springAnimation.gif)

<hr/>

## SwiftUI Spring Animation Types


## 1. .spring()
A spring with no parameters. It applies gentle and sensible spring-feel to the object you want to animate.

### Menu - Close icon transition: <a href="https://github.com/GetStream/swiftui-spring-animations/blob/main/SwiftUISpringAnimations/Spring.swift"> Swift file</a>
![Menu - Close icon ](https://github.com/GetStream/swiftui-spring-animations/blob/main/Misc/menuToClose.gif)


## 2. .interactiveSpring()
An interactive spring with no parameters. This creates a spring animation with a high stiffness and a low response. It creates a spring animation that is less snappy:

### Menu - Close icon transition: <a href="https://github.com/GetStream/swiftui-spring-animations/blob/main/SwiftUISpringAnimations/InteractiveSpring.swift"> Swift file</a>
![Menu - Close icon ](https://github.com/GetStream/swiftui-spring-animations/blob/main/Misc/menuTocloseInteractive.gif)

## 3. .interpolatingSpring(stiffness, damping)
This allows you to create a spring animation that is based on stiffness and damping. 
  * Stiffness: 
    It is defined as the tensile strength of the spring. A higher stiffness will result in a snappier animation. This affects the force applied to the object   
    and changes how quickly the object moves towards its target.
  * Damping: You can think of damping as the braking of a car or the back-drag frictional force of the surface the object is resting on. Its purpose is to stop     the object over time. It also affects the ability to overshoot the object. **Hint**: Start with a damping of 15 and stiffness of 170. Reducing the damping     to for example, 5 will create a spring animation that has a higher bounciness.

### Chat message reactions: <a href="https://github.com/GetStream/swiftui-spring-animations/blob/main/SwiftUISpringAnimations/ReactionsViewInterpolatingSpringSD.swift"> Swift file</a>
![Chat message reactions ](https://github.com/GetStream/swiftui-spring-animations/blob/main/Misc/messengerReacrions.gif)
**:**

**.interpolatingSpring(mass, stiffness, damping, initialVelocity):**

**.spring(response, dampingFraction, blendDuration):**

**.interactiveSpring(response, dampingFraction, blendDuration):**


** Related Links **
- [https://developer.apple.com/documentation/quartzcore/caspringanimation#2826917](https://developer.apple.com/documentation/quartzcore/caspringanimation#2826917)
- [https://developpaper.com/ios-spring-animations/](https://developpaper.com/ios-spring-animations/)
- [https://popmotion.io/#quick-start-animation-animate-spring-options](https://popmotion.io/#quick-start-animation-animate-spring-options)
- [https://www.raywenderlich.com/books/ios-animations-by-tutorials/v6.0/chapters/4-springs](https://www.raywenderlich.com/books/ios-animations-by-tutorials/v6.0/chapters/4-springs)
