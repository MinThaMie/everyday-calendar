import Component from '@glimmer/component';
import { concat } from '@ember/helper';
import DayButton from './day-button';
import { modifier } from 'ember-modifier';

export default class Calendar extends Component {
  get getYearDates() {
    const year = new Date().getYear();
    const yearDates = {};

    for (let month = 0; month < 12; month++) {
      const date = new Date(year, month, 1);
      const monthName = date
        .toLocaleString('default', { month: 'short' })
        .toLowerCase();
      const daysInMonth = new Date(year, month + 1, 0).getDate();
      yearDates[monthName] = Array.from(
        { length: daysInMonth },
        (_, i) => i + 1,
      );
    }
    return yearDates;
  }

  scrollToToday = modifier(() => {
    let dateToday = new Date();
    const today = document.getElementById(
      `${dateToday
        .toLocaleString('default', { month: 'short' })
        .toLowerCase()}-${dateToday.getDate()}`,
    );

    if (today) {
      today.scrollIntoView({
        behavior: 'smooth',
        block: 'center',
        inline: 'center',
      });
    }
  });

  <template>
    <div class="calendar-container" {{this.scrollToToday}}>
      <div class="calendar">
        {{#each-in this.getYearDates as |month days|}}
          <div class="month">
            <h1>{{month}}</h1>
            {{#each days as |day|}}
              <DayButton @id={{concat month "-" day}} @number={{day}} />
            {{/each}}
          </div>
        {{/each-in}}
      </div>
      <div class="attribution">
        <h2>Inspired by Simone Giertz’s <em>Every Day Goal Calendar</em></h2>
        <p>
          This digital version is a tribute to
          <strong>Simone Giertz</strong>, who designed the
          <em>Every Day Goal Calendar</em>
          to track daily habits in a simple, satisfying way. Her original
          creation is a beautifully crafted physical piece—this is a digital
          homage to her brilliant idea.
        </p>
        <p>
          For the original, visit
          <a
            href="https://yetch.studio/products/every-day-goal-calendar"
            target="_blank"
            rel="noopener noreferrer"
          >Simone Giertz’s Every Day Goal Calendar</a>.
        </p>
      </div>
    </div>
  </template>
}
