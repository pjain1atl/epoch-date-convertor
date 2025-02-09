## Author 

Pankaj Jain
Date: February 9, 2025

## Overview

This documentation explains how to convert an Epoch timestamp to a human-readable date format (MM/dd/YYYY) using DataWeave 2.5. The provided script extracts the timestamp from a given string format and adjusts it based on the timezone offset.

## Prerequisites

MuleSoft Anypoint Studio or a MuleSoft Runtime environment that supports DataWeave 2.5.

Basic understanding of DataWeave scripting language.

## Code Explanation

The following DataWeave script is used to convert an Epoch timestamp embedded in a specific date string format (/Date(1739116119000-0500)/) to a human-readable date format:


Breakdown of the Logic

- Extracting the Timestamp
- The datePattern regex captures the Unix timestamp and the timezone offset from the input string.
- Example: /Date(1739116119000-0500)/ results in:
- timestamp = 1739116119000
- timezoneOffset = -0500
- Handling Timezone Offsets
- The script calculates the offset in milliseconds.
- It adjusts the timestamp by adding/subtracting the offset.
- Converting to Date
- Converts the adjusted timestamp to days since 1970-01-01.
- Uses DataWeave’s period addition feature to compute the final date.

**Expected Output**
For the input /Date(1739116119000-0500)/, the output will be:
{
  "FlightDate": "02/09/2025"
}

## Usage

This function can be used to process API responses that contain dates in the Epoch format.

It ensures the converted date properly accounts for timezone differences.
