matching_personas -- a clustering, segmentation, and collaborative filter test.
===
# introduction
given a rare access to files relating to hospitality exchange files. 
this is a research project to use clustering strategy to:

- improve matching (e.g., recommending the best housesitters to homeowners or vice versa).
- identify potential underserved segments (e.g., housesitters for exotic pets or in rural areas).
- understand user personas (e.g., casual vs. professional housesitters).

# project structure
```

    ├── README.md                               --- this file
    ├── data                                    -- local data
    │   ├── links_to_the_data.md                -- paths to raw data from google drive
    │   ├── raw                                 -- local storage of raw data
    │   └── sits.ddb                            -- local datbase for raw and processed data
    ├── img                                     -- diagrams and plots
    ├── notebooks                               -- ordered data processing scripts and literate programming docs
    ├── notes                                   -- notes, instructions, further information
    │   └── eda                                 -- exploratory data analysis of datasets
    ├── presentation                            -- documents for sharing the progress and results
    ├── requirements.txt                        -- list of libraries used
    ├── sql                                     -- database management scripts
    └── src                                     -- python/shell utility functions

```
# the data
the data is sourced from google drive folders:
- [data dictionary.](https://drive.google.com/file/d/1qQkDWIpa47tOVlQf6VHcuhTkx4RaYhfA/view?usp=sharing) 
- [archive of csv files](https://drive.google.com/file/d/1yHuV53uh8W_jWqT98PL8D2bxRZ4hCBJA/view?usp=drivelink)

## schema

the eight data tables are:

- profiles (housesitter profiles)
- listings (homeowner listings)
- users (user contact details)
- pets (details of the pets belonging to a listing)
- applications (requests by a sitter to a sit, and invites of homeowneres to sitters)
- assignments (sitter + sits connections)
- feedback (feedback left by housesitters on the sit)
- reviews (feedback left by homeowners on the sitter)



## table sizes

```
    +----------------+------------+-----------+
    |    table       |  # rows    | # columns |
    +----------------+------------+-----------+
    |  applications  | 1,067,480  |           |
    |  assignments   |   198,025  |           |
    |  users         |   104,414  |      16   |
    |  reviews       |    95,646  |           |
    |  pets          |    83,457  |           |
    |  feedback      |    77,634  |           |
    |  listings      |    70,860  |           |
    |  profiles      |    34,916  |      51   |
    +----------------+------------+-----------+
    |  total         | 1,732,432  |    --     |
    +----------------+------------+-----------+
```