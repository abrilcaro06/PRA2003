#Deliverable 3 (SET 1)


#There is a total of 12 ID of bacteria, and each header line is the tells the experiment number, and the number of experiments under it (first header is 1 33 (experiment 1 and 33 under that)
#If experiment has a first number, but the second number is equal to 0, then ensure R does not run it (as that is not counted as events)
#The data is then data for 3 columns and then the bacterial ID on column 4.


#Chosen to look at "output-Set1.txt", so when running, ensure that is downloaded and in a folder where it can run.


defaultFile <- "output-Set1.txt" #if using different file and dont change that, the defule will be "output-Set1.txt"
chunkSize <- 1000000 # telling it to only read max 1000000 lines at a time as the file is really big
fieldSep <- " " # separator between the fields of a line
headerFields <- 2 # fields in a header line: eventNumber nBacteria
dataFields <- 4 # fields in a data line: px py pz bacterialID
inputPrefix <- "output-" # input "output-<name>.txt" gives ...
outputPrefix <- "results-" # ... output "results-<name>.csv"
outputExtension <- ".csv"
averageDigits <- 5 # decimals kept for the average per event
uncertaintySignifDigits <- 3 # significant digits kept for the uncertainty

#Adding the ID for all 12 bacteria, so if there are other numbers that arent these, it wont take into consideration
strainID <- c(211, -211, 321, -321, 2212, -2212, 3122, -3122, 3312, -3312, 3334, -3334)


#Writing all the names of each strain
strainName <- c(
"E. coli WT",
"E. coli mutant",
"Bacillus subtilis WT",
"Bacillus subtilis mutant",
"Pseudomonas aeruginosa WT",
"Pseudomonas aeruginosa antibiotic-resistant",
"Streptococcus pneumoniae",
"Capsule-deficient S. pneumoniae",
"Mycobacterium tuberculosis",
"Drug-resistant M. tuberculosis",
"Salmonella enterica",
"Salmonella mutant"
)

#Here it puts that the lenght is dependent on the ones for function strain ID (so all the 12 IDs that are added above)
nStrains <- length(strainID)


#making sure all inputs have the correct values and that the strain ID match before running
isWholeNumber <- function(x, minimum) {
is.numeric(x) && length(x) == 1 && !is.na(x) && x >= minimum && x == round(x)
}
#checks if whole number is above minimum)

isText <- function(x) {
is.character(x) && length(x) == 1 && !is.na(x) && nzchar(x)
}
#checks if value is a single text string

if (!isWholeNumber(chunkSize, 1)) {
stop("Setting chunkSize must be a whole number of at least 1, not: ", chunkSize)
}

if (!isWholeNumber(headerFields, 1) || !isWholeNumber(dataFields, 1) ||
headerFields == dataFields) {
stop("Settings headerFields and dataFields must be whole numbers and different from ",
"each other .")
}

if (!isText(fieldSep) || nchar(fieldSep) != 1) {
stop("Setting fieldSep must be a single character.")
}

if (!isWholeNumber(averageDigits, 0) ||
!isWholeNumber(uncertaintySignifDigits, 1)) {
stop("Settings averageDigits and uncertaintySignifDigits must be whole numbers.")
}

if (!isText(defaultFile) || !isText(outputPrefix) || !isText(outputExtension)) {
stop("Setting defaultFile, outputPrefix and outputExtension must be text.")
}

if (length(strainName) != nStrains) {
stop("strainID has ", nStrains, " values but strainName has ", length(strainName), ".")
}
#checks that strainID and strainName have same entries, if they differ then the code tells to stop


if (anyNA(strainID) || anyDuplicated(strainID) > 0) {
stop("strainID must not contain missing or duplicate values.")
}
#makes sure that duplication doesnt happen


#lineRegex(n) matches a line with exactly n fields separated by fieldSep.
lineRegex <- function(nFields) {
notSep <- paste0("[^", fieldSep, "]")
paste0("^", notSep, "+(", fieldSep, notSep, "+){", nFields - 1, "}$")
}

headerRegex <- lineRegex(headerFields)

dataRegex <- lineRegex(dataFields)

lastFieldRegex <- paste0("^.*", fieldSep)


#Process chunk used to clean the chunk of data at a time
processChunk <- function(chunk) {
chunk <- sub("\r$", "", chunk, perl = TRUE) # returns true if strings are not empty, and false if they are. 
chunk <- chunk[nzchar(chunk)] # skip empty lines

#isHeader used to classify the line in chunk as header line or data line  - if true, then looks like header, if false it does not
#perl = true, used to tell R to use "per-stlye regen synthax" (used to match patterns)
isHeader <- grepl(headerRegex, chunk, perl = TRUE)
isData <- !isHeader & grepl(dataRegex, chunk, perl = TRUE)
#isData is the opposite of isHeader


#lastField, telling that we only need the last number (bacterial ID and the name) - ignores the middle columns data
lastField <- sub(lastFieldRegex, "", chunk, perl = TRUE)


#checking header lines (selects only entries that are headers) A number that is
#missing, negative or not whole makes the header malformed.

nBacteriaInEvent <- suppressWarnings(as.numeric(lastField[isHeader]))
#converts text values into numerals


badHeader <- is.na(nBacteriaInEvent) | nBacteriaInEvent < 0 |
#if its not whole number, or negative then considered bad header, and will then not be used

nBacteriaInEvent != round(nBacteriaInEvent)
nBacteriaInEvent <- nBacteriaInEvent[!badHeader]
#removes the bad headers


#Data lines: the bacterial ID. An ID that is not a number is malformed.

#lastField[isData] selects values from wanted rows and then ignores the irrelevant ones, while the as.numeric turns the text into numbers. SupressWarnings prevents R from showing the warnings (just removes them instead)
ids <- suppressWarnings(as.numeric(lastField[isData]))

#badID marks the ones that cant be used and removes them
badId <- is.na(ids)
ids <- ids[!badId]
row <- match(ids, strainID) # position in strainID, NA if not one of the strains

#creates vector indicating which ID is valid , if get a false it shows taht the id doesnt match the reference
known <- !is.na(row)


#list used to show data in a structured way
list(
nEvents = sum(nBacteriaInEvent > 0), #counts headers with numbers more than 0
counts = tabulate(row[known], nbins = nStrains), #counts how many ID fit in each strain catagory
nOther = sum(!known), #counts IDs not recognized
nMalformed = sum(!isHeader & !isData) + sum(badHeader) + sum(badId), #totals the lines that are not valid
nDeclared = sum(nBacteriaInEvent),
nData = length(ids) #records valid data rows after cleaning
)
}




#checking arguments passed to script after script name itself
args <- commandArgs(trailingOnly = TRUE)


#if lenght is more than 1 then it stops
if (length(args) > 1) {
stop(
"Give at most one argument (the input file), but got ", length(args), ": ",
paste(args, collapse = " ")
)
}

#to check filepath, do args[1] when only one line commantment argument is given, if not then uses default file
filepath <- if (length(args) == 1) args[1] else defaultFile

if (!isText(filepath)) {
stop("The input file name is empty.")
}

#ensures that the file used exists, if not then states file not found
if (!file.exists(filepath)) {
stop("File not found: ", filepath, " - put it in the same folder as this script.")
}

#protection incase file is in folder and not file, allows correction
if (dir.exists(filepath)) {
stop(filepath, " is a folder, not a file.")
}

#mode=4 is read permision, if its not zero, then no permition to read file
if (file.access(filepath, mode = 4) != 0) {
stop("No permission to read: ", filepath)
}

#makes sure file size is not empty (if empty then show error "The file is empty")
if (is.na(file.size(filepath)) || file.size(filepath) == 0) {
stop("The file is empty: ", filepath)
}



totalCount <- rep(0, nStrains) # creates count per strain - starting at 0
nEvents <- 0 # start counter for events with at least one bacteria
nOther <- 0 # start counter for bacteria with an ID outside the strains
nDeclared <- 0 # start counter for total articles announced by the header lines
nData <- 0 # counter for valid data lines found
nMalformed <- 0 # counter for lines that are not a valid header or data line
linesRead <- 0 # lines read so far (used in error messages)

con <- file(filepath, "r") #open input file in read-only  and store it as con

tryCatch({
repeat {
chunk <- readLines(con, n = chunkSize)

#check if chunk is empty
if (length(chunk) == 0) {
  break
}

result <- processChunk(chunk)

totalCount <- totalCount + result$counts
nEvents    <- nEvents + result$nEvents
nOther     <- nOther + result$nOther
nMalformed <- nMalformed + result$nMalformed
nDeclared  <- nDeclared + result$nDeclared
nData      <- nData + result$nData
linesRead  <- linesRead + length(chunk)

}

#defines what to do if error occurs while reading
}, error = function(e) {
stop(
"Reading ", filepath, " failed after about ", linesRead, " lines: ",
conditionMessage(e),
call. = FALSE
)
}, finally = close(con))

if (nEvents == 0) {
stop("No events found in file - check the file path/format.")
}


#if nothing found and sum =0 then no strains found
if (sum(totalCount) == 0) {
stop("None of the ", nStrains, " strain IDs occur in the file - check the file format.")
}

if (nMalformed > 0) {
warning(
nMalformed, " lines were not a valid header (", headerFields, " fields) or ",
"data line (", dataFields, " fields with a numeric ID) and were ignored"
)
}

#check if number of bacteria declared by headers matches number of valid data lines
if (nDeclared != nData) {
warning("Headers announce ", nDeclared, " bacteria but ", nData, " were found")
}


#computing the statilistcs
#average per event = total count / number of events
#uncertainty = sqrt(total count) / number of events

avgPerEvent <- totalCount / nEvents
uncertainty <- sqrt(totalCount) / nEvents

results <- data.frame(
ID = strainID,
Strain = strainName,
TotalCount = totalCount,
AveragePerEvent = round(avgPerEvent, averageDigits),
Uncertainty = signif(
uncertainty,
uncertaintySignifDigits
) # significant digits: the smallest values are tiny
)

#printing results

cat("Total events processed:", nEvents, "\n")
cat("Bacteria with an ID outside the", nStrains, "strains (ignored):", nOther, "\n")
cat("Lines that were not valid (ignored):", nMalformed, "\n\n")
print(results)


