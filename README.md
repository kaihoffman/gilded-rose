## Gilded Rose ruby refactoring kata

### Approach
1. Create (feature) tests for the various types of items defined in the spec. These allowed me to keep track of the correctness of any changes I made in the main code, as I knew that technically the code was passing. These included:
    - Updating quality on normal items
    - Guarding against quality going below 0
    - Brie increasing in quality, but maxing out at 50
    - Sulfuras doing absolutely nothing
    - Backstage pass value changes over time
2. Refactoring out private methods for quality update and decreasing the sell_in value.
3. Refactoring in a ```MAX-QUALITY``` constant to reduce magic numbers.
4. Using a linter to ensure that my code conformed to standards.

### Learnings

Gilded Rose is not just a refactoring challenge; it's also a testing challenge. Any attempt at completing this kata is reliant on a comprehensive-enough test suite to cover all bases.

Committing early and often, with good commit messages, will help with understanding one's process for approaching a challenge.