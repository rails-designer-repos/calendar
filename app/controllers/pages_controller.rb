class PagesController < ApplicationController
  WEEK_START = :monday

  EVENTS = [
    Event.new(title: "Past retro",    starts_on: Date.current.beginning_of_month - 3,  color: "oklch(62% 0.14 300)"),
    Event.new(title: "Design review", starts_on: Date.current.beginning_of_month + 2,  color: "oklch(65% 0.18 250)"),
    Event.new(title: "Team offsite",  starts_on: Date.current.beginning_of_month + 2,  color: "oklch(70% 0.17 40)"),
    Event.new(title: "Ship release",  starts_on: Date.current.beginning_of_month + 7,  color: "oklch(68% 0.16 150)"),
    Event.new(title: "Next planning", starts_on: Date.current.end_of_month + 2,        color: "oklch(66% 0.15 20)")
  ]

  def show
    @range = CalendarRange.from month_param, week_start: WEEK_START
    @events_by_day = EVENTS.group_by &:starts_on
  end

  private

  def month_param
    Date.parse params[:start_date].to_s
  rescue Date::Error
    Date.current
  end
end
