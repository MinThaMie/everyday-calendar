import Component from '@glimmer/component';
import { action } from '@ember/object';
import { on } from '@ember/modifier';
import { trackedInLocalStorage } from 'ember-tracked-local-storage';

export default class DayButton extends Component {
  @trackedInLocalStorage({ defaultValue: '' }) completedDays;

  get isActive() {
    return this.completedDays.includes(`${this.args.id},`);
  }

  get isToday() {
    let dateToday = new Date();
    return (
      this.args.id ==
      `${dateToday
        .toLocaleString('default', { month: 'short' })
        .toLowerCase()}-${dateToday.getDate()}`
    );
  }

  @action
  click() {
    if (this.completedDays.split(',').includes(this.args.id)) {
      this.completedDays = this.completedDays
        .split(',')
        .filter((item) => item !== this.args.id)
        .join(',');
    } else {
      this.completedDays += `${this.args.id},`;
    }
  }

  <template>
    <button
      class="hex-button
        {{if this.isActive 'active'}}
        {{if this.isToday 'today'}}"
      id={{@id}}
      type="button"
      {{on "click" this.click}}
    >
      <svg
        fill="#000000"
        version="1.1"
        viewBox="0 0 512 512"
        xml:space="preserve"
        xmlns="http://www.w3.org/2000/svg"
        xmlns:svg="http://www.w3.org/2000/svg"
        aria-label="hexagon"
      >
        <g transform="matrix(0.92070745,0,0,0.92070745,20.297972,20.294488)">
          <g>
            <path
              d="m 485.291,129.408 -224,-128 c -3.285,-1.877 -7.296,-1.877 -10.581,0 l -224,128 c -3.328,1.899 -5.376,5.44 -5.376,9.259 v 234.667 c 0,3.819 2.048,7.36 5.376,9.259 l 224,128 c 1.643,0.939 3.456,1.408 5.291,1.408 1.835,0 3.648,-0.469 5.291,-1.408 l 224,-128 c 3.328,-1.899 5.376,-5.44 5.376,-9.259 V 138.667 c -0.001,-3.819 -2.049,-7.36 -5.377,-9.259 z"
            />
            <path
              class="pulse"
              d="m 485.291,129.408 -224,-128 c -3.285,-1.877 -7.296,-1.877 -10.581,0 l -224,128 c -3.328,1.899 -5.376,5.44 -5.376,9.259 v 234.667 c 0,3.819 2.048,7.36 5.376,9.259 l 224,128 c 1.643,0.939 3.456,1.408 5.291,1.408 1.835,0 3.648,-0.469 5.291,-1.408 l 224,-128 c 3.328,-1.899 5.376,-5.44 5.376,-9.259 V 138.667 c -0.001,-3.819 -2.049,-7.36 -5.377,-9.259 z"
            />
          </g>
        </g>
      </svg>
      <span>{{@number}}</span>
    </button>
  </template>
}
