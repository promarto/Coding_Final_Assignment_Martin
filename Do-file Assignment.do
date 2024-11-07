use "C:\Users\Stoilov_Martin\Desktop\Assignment Stata\clean\hotels-vienna.dta"
bro

////Cleaning the data. Fixing common data quality errors
tabulate rating_count, missing
drop if missing(rating_count)


destring ratingta_count, replace

replace ratingta_count = subinstr(ratingta_count, "$", "", .)
replace ratingta_count = subinstr(ratingta_count, ",", "", .)
drop holiday weekend month
drop nnights scarce_room

egen count_hotels = count(hotel_id), by(city)
egen max_price = max(price), by(neighbourhood)

//Creating a summary statistics table
summarize
sum, detail
sum distance, detail

//Creating a graph using a histogram
histogram distance
//Saving a graph
graph export "distance.png", replace
