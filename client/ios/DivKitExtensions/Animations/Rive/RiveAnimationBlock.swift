import Foundation

import CommonCore
import LayoutKit

public final class RiveAnimationBlock: BlockWithTraits {
  let animationHolder: AnimationHolder
  let animatableView: Lazy<AnimatableView>
  public let widthTrait: LayoutTrait
  public let heightTrait: LayoutTrait

  public var debugDescription: String {
    "Sized Animation Block is playing animation with \(animationHolder)"
  }

  public init(
    animationHolder: AnimationHolder,
    animatableView: Lazy<AnimatableView>,
    widthTrait: LayoutTrait,
    heightTrait: LayoutTrait
  ) {
    self.animationHolder = animationHolder
    self.animatableView = animatableView
    self.widthTrait = widthTrait
    self.heightTrait = heightTrait
  }

  public var intrinsicContentWidth: CGFloat {
    switch widthTrait {
    case .fixed(let value):
      return value
    case .intrinsic, .weighted:
      return 0
    }
  }

  public func intrinsicContentHeight(forWidth: CGFloat) -> CGFloat {
    switch heightTrait {
    case .fixed(let value):
      return value
    case .intrinsic, .weighted:
      return 0
    }
  }

  public func equals(_ other: Block) -> Bool {
    other is RiveAnimationBlock && self == other
  }

  public func getImageHolders() -> [ImageHolder] { [] }
}

extension RiveAnimationBlock: LayoutCachingDefaultImpl {}
extension RiveAnimationBlock: ElementStateUpdatingDefaultImpl {}
