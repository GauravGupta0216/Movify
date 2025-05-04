# Movify

Movify is an iOS application that allows users to explore trending and now-playing movies, search for movies, and bookmark their favorite ones for easy access. The app is built using Swift and follows the MVVM architecture pattern for clean and scalable code.

## Features

- **Home Screen**: Displays trending and now-playing movies in a visually appealing layout.
- **Search**: Allows users to search for movies by title.
- **Movie Details**: Provides detailed information about a selected movie, including its title, release date, genres, and overview.
- **Bookmarks**: Enables users to bookmark their favorite movies and view them in a dedicated bookmarks section.
- **Offline Support**: Bookmarked movies are stored locally using Core Data for offline access.
- **Responsive Design**: Optimized for various iPhone screen sizes, ensuring a seamless user experience.

## Screenshots

### Home Screen
The home screen displays trending and now-playing movies in a horizontal scrollable layout.

![Home Screen](Screens/Home_Screen.png)

### Search Screen
The search screen allows users to search for movies by title and displays the results in a list.

![Search Screen](Screens/Search_Screen.png)

### Movie Details Screen
The movie details screen provides detailed information about a selected movie, including its title, release date, genres, and overview. Users can bookmark the movie using the heart icon.

![Movie Details Screen](Screens/Movie_Detail_Screen.png)

### Bookmarks Screen
The bookmarks screen displays a list of movies that the user has bookmarked.

![Bookmarks Screen](Screens/BookMark_Screen.png)

## Installation

1. Open the project in Xcode:
    ```bash
    cd movify
    open Movify.xcodeproj
    ```
2. Build and run the app on a simulator or a physical device.

## Technologies Used

- **Swift**: The programming language used to build the app.
- **MVVM Architecture**: Ensures clean separation of concerns and scalability.
- **Core Data**: Used for local data storage to support offline access.
- **The Movie Database (TMDb) API**: Provides movie data such as trending movies, now-playing movies, and search functionality.

## Project Structure

Movify/
├── App/
│   ├── [ContentView.swift](http://_vscodecontentref_/0)
│   ├── [MovifyApp.swift](http://_vscodecontentref_/1)
├── Component/
│   ├── [HeaderView.swift](http://_vscodecontentref_/2)
│   ├── [ImageLoaderView.swift](http://_vscodecontentref_/3)
│   ├── [LoadingView.swift](http://_vscodecontentref_/4)
├── CoreData/
│   ├── [CoreDataManager.swift](http://_vscodecontentref_/5)
│   ├── MovifyDataModel.xcdatamodeld/
├── Helper/
│   ├── [MovifyConstants.swift](http://_vscodecontentref_/6)
│   ├── [MovifyHelper.swift](http://_vscodecontentref_/7)
│   ├── [ScreenState.swift](http://_vscodecontentref_/8)
├── Model/
│   ├── [MoviesModel.swift](http://_vscodecontentref_/9)
├── Resources/
│   ├── Assets.xcassets/
│   ├── MockFiles/
├── Screens/
│   ├── Home/
│   │   ├── [HomeView.swift](http://_vscodecontentref_/10)
│   │   ├── Trending/
│   │   │   ├── [TrendingMoviesView.swift](http://_vscodecontentref_/11)
│   │   │   ├── [TrendingMoviesViewModel.swift](http://_vscodecontentref_/12)
│   │   ├── NowPlaying/
│   │       ├── [NowPlayingMoviesView.swift](http://_vscodecontentref_/13)
│   │       ├── [NowPlayingMoviesViewModel.swift](http://_vscodecontentref_/14)
│   ├── Search/
│   │   ├── [SearchView.swift](http://_vscodecontentref_/15)
│   │   ├── [SearchViewModel.swift](http://_vscodecontentref_/16)
│   ├── Bookmarks/
│   │   ├── [BookmarksView.swift](http://_vscodecontentref_/17)
│   │   ├── [BookmarkViewModel.swift](http://_vscodecontentref_/18)
│   ├── Common/
│       ├── [MovieDetailView.swift](http://_vscodecontentref_/19)
│       ├── [MovieRow.swift](http://_vscodecontentref_/20)
│       ├── [MoviePosterView.swift](http://_vscodecontentref_/21)
├── Services/
│   ├── [NetworkServices.swift](http://_vscodecontentref_/22)
│   ├── [TMDBClientServices.swift](http://_vscodecontentref_/23)
│   ├── [TMDBServiceProtocol.swift](http://_vscodecontentref_/24)
│   ├── [MockTMDBClientServices.swift](http://_vscodecontentref_/25)
│   ├── [MockDataLoader.swift](http://_vscodecontentref_/26)
├── Tests/
│   ├── MovifyTests/
│   │   ├── [MovifyHelperTests.swift](http://_vscodecontentref_/27)
│   │   ├── [MovifyTests.swift](http://_vscodecontentref_/28)
│   ├── MovifyUITests/
│       ├── [MovifyUITests.swift](http://_vscodecontentref_/29)
│       ├── [MovifyUITestsLaunchTests.swift](http://_vscodecontentref_/30)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.