module CalendarHelper
  def day_classes(day, month)
    class_names(
      "day",
      today: day == Date.current,
      weekend: day.saturday? || day.sunday?,
      "previous-month": day < month,
      "next-month": day > month.end_of_month
    )
  end
end
