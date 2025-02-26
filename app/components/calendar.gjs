import Component from '@glimmer/component';
import { concat } from '@ember/helper';
import DayButton from './day-button';
export default class Calendar extends Component {
  get getYearDates() {
    const year = new Date().getYear();
    const yearDates = {};

    for (let month = 0; month < 12; month++) {
      const date = new Date(year, month, 1);
      const monthName = date
        .toLocaleString('default', {month: 'short'}).toLowerCase();
      const daysInMonth = new Date(year, month + 1, 0).getDate();
      yearDates[monthName] = Array.from(
        { length: daysInMonth },
        (_, i) => i + 1,
      );
    }

    return yearDates;
  }

  <template>
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
  </template>
}
