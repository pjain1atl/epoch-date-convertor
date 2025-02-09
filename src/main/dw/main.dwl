%dw 2.5
import * from dw::core::Strings
	  
fun dateInMMdduuuu(dateInUnixEpochFormat) = do {
    var dateString = dateInUnixEpochFormat
    var datePattern = /\/Date\((-?\d+)([+-]\d{4})\)\//
    var extracted = dateString match datePattern
    var timestamp = extracted[1] as Number

    var timezoneOffset = extracted[2] as String
    var sign = if (substring(timezoneOffset, 0, 1) ~= "+") 1 else -1
    var offsetHours = substring(timezoneOffset, 1, 3) as Number
    var offsetMinutes = substring(timezoneOffset, 3, 5) as Number

    // Convert to milliseconds and adjust for the offset
    var offsetMillis = (sign * ((offsetHours * 3600000) + (offsetMinutes * 60000))) as Number
    var adjustedTimestamp = timestamp + offsetMillis
    var dayinSeconds = 3600 * 24

    var days = floor((adjustedTimestamp / 1000) / dayinSeconds)
---    
    (|1970-01-01| + ("P$(days)D" as Period)) as String
}

fun formatEpochDate(k,v) = if (!isEmpty(v)) {(k):dateInMMdduuuu(v)} else {(k):v}
---
formatEpochDate("FlightDate","/Date(1739116119000-0500)/")