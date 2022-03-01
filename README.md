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


**.interpolatingSpring(stiffness, damping):**

**.interpolatingSpring(mass, stiffness, damping, initialVelocity):**

**.spring(response, dampingFraction, blendDuration):**

**.interactiveSpring(response, dampingFraction, blendDuration):**


** Related Links **
- [https://developer.apple.com/documentation/quartzcore/caspringanimation#2826917](https://developer.apple.com/documentation/quartzcore/caspringanimation#2826917)
- [https://developpaper.com/ios-spring-animations/](https://developpaper.com/ios-spring-animations/)
- [https://popmotion.io/#quick-start-animation-animate-spring-options](https://popmotion.io/#quick-start-animation-animate-spring-options)
- [https://www.raywenderlich.com/books/ios-animations-by-tutorials/v6.0/chapters/4-springs](https://www.raywenderlich.com/books/ios-animations-by-tutorials/v6.0/chapters/4-springs)
