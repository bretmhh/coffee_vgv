# VGV Coffee App
This application only implements the first feature of getting a random coffee image due to my time constraints.

The layered opinionatedarchitecture(clean) is as follows:
Note, this is just how I write my code as of right. Although open minded to all patterns.
## Layered Architecture
- `presentation` - The presentation layer. (UI, controllers (cubits/blocs/providers w.e you want to call it))
- `data` - The data layer. (data sources, repositories impls)
- `domain` - The domain layer. (business logic, use cases, repository interfaces    )

Tests are organized in the same manner as the architecture.

## TODO
- Add the second feature of saving the image to the phone. I would have used a community package in this instance.

## Notes
- I would recommend focus on the robustness/architecture of the code. I did not spend ANY time styling. There would be a component library for that.
- I was limited on time, only had enough time before traveling for holidays (today) to implement the first feature.
- The architecture is opinionated. Combined patterns aligning with Clean.
- If I were to have started this back when the email was in my Spam, I would have easily completed this.
- Only had roughly ~3 hours to get this point while packing and traveling in a car from South California to Northern California.

## Running The Application
Run these from the root directory of the project.
```bash
flutter run
```
## Running The Tests
```bash
flutter test
```