# OPBitMaskNumber [![Build Status](https://travis-ci.org/azu/OPBitMaskNumber.png?branch=master)](https://travis-ci.org/azu/OPBitMaskNumber)

OPBitMaskNumber handling bit-mask library.

## Installation

``` sh
pod 'OPBitMaskNumber'
```

## Usage

``` objc
typedef NS_ENUM(NSInteger, TestMaskType) {
    TestMaskTypeDefault = 1,
    TestMaskTypeValue1,
    TestMaskTypeValue2,
    TestMaskTypeSubSub
};

OPBitMaskNumber *bitMaskNumber = [OPBitMaskNumber bitMaskNumberWithValue:@(0)];
bitMaskNumber.originalValue; // => @0
[bitMaskNumber maskingBitToOnAtIndex:TestMaskTypeDefault];// bit to on
[bitMaskNumber maskingBitToOffAtIndex:TestMaskTypeDefault]; // bit to off
[bitMaskNumber togglingBitAtIndex:TestMaskTypeDefault];// toggle bit => bit to on
[bitMaskNumber stateAtIndex:TestMaskTypeDefault];// bit state : YES
bitMaskNumber.originalValue; // => @(2^1) get total value
```

See `OPBitMaskNumberTests`

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT