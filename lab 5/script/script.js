// JavaScript source code

var vue = new Vue({
    el: "#app",
    data: {
        result1: '',
        result2: '',
        result3: '',
        x: 0.13,
        errors: [],
        text1: null,
        text2: null,
        text3: null,
        text4: null,
        text5: null
    },
    methods: {
        checkForm: function (e) {
            if (this.zarplata && this.premia && this.koificent && this.rabocie && this.otrabotanye) {
                return true;
            }
            this.errors = [];

            if (!this.text1) {
                this.errors.push(' zapolnite pole 1 ');

            }
            if (!this.text2) {
                this.errors.push(' zapolnite pole 2 ');

            }
            if (!this.text3) {
                this.errors.push(' zapolnite pole 3 ');

            }
            if (!this.text4) {
                this.errors.push(' zapolnite pole 4 ');
                
            }
            if (!this.text5) {
                this.errors.push(' zapolnite pole 5 ');

            }
            e.preventDefault();
        },

        calc1: function () {
            this.result1 = eval(this.text1 * this.text3 * (this.text5 / this.text4) + eval(this.text2));
            this.result2 = eval(this.result1 * this.x);
            this.result3 = eval(this.result1 - this.result2);
        },
    }
}) 