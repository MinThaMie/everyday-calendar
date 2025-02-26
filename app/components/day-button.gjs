import Component from '@glimmer/component';
import action from '@ember/object';
import { on } from '@ember/modifier';

export default class DayButton extends Component {
  get isActive() {
    const completedDays =
      JSON.parse(localStorage.getItem('completedDays')) ?? [];
    console.log(completedDays);
    return completedDays.includes(this.args.id);
  }

  @action
  click() {
    try {
      let completedDays =
        JSON.parse(localStorage.getItem('completedDays')) ?? [];
      if (completedDays.includes(this.args.id)) {
        completedDays = completedDays.filter((item) => item !== this.args.id);
        localStorage.setItem('completedDays', JSON.stringify(completedDays));
      } else {
        completedDays.push(this.args.id);
        completedDays = JSON.stringify(completedDays);
        localStorage.setItem('completedDays', completedDays);
      }
    } catch (e) {
      console.log(e);
      localStorage.setItem('completedDays', []);
    }
  }

  <template>
    <button
      class="hex-button {{if this.isActive 'active'}}"
      data-value={{@id}}
      type="button"
      {{on "click" this.click}}
    >{{@number}}</button>
  </template>
}
