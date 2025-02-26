import { module, test } from 'qunit';
import { setupRenderingTest } from 'everyday-calendar/tests/helpers';
import { render } from '@ember/test-helpers';
import { hbs } from 'ember-cli-htmlbars';

module('Integration | Component | day-button', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    // Set any properties with this.set('myProperty', 'value');
    // Handle any actions with this.set('myAction', function(val) { ... });

    await render(hbs`<DayButton />`);

    assert.dom().hasText('');

    // Template block usage:
    await render(hbs`
      <DayButton>
        template block text
      </DayButton>
    `);

    assert.dom().hasText('template block text');
  });
});
