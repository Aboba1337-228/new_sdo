<template>
    <div class="v-test">
        <div class="v-container-test">
            <h2>Тест</h2>
            <div class="v-test-data">
                <div class="v-test-card" 
                    v-for="i in isQuest.length" 
                    :key="i">
                    <div class="v-test-quest">{{i}}: <img 
                        width="250" 
                        height="250" 
                        :src="`${url_image}`+isQuest[i - 1].quest" 
                        alt=""></div>
                    <input type="text" v-model="answer[i - 1]"  placeholder="Введите ответ">
                </div>
            </div>
            <BtnTest title="Завершить тест" @click.prevent="submit()" />
        </div>
    </div>
</template>

<script>
import axios from 'axios'
import BtnTest from '../components/UI/Button/v-btn-form.vue'
import config from '@/config'
import router from '@/router'

export default {
    components: {
      BtnTest  
    },

    data() {
        return {
            isQuest: [],
            answer: [],
            url_image: ""
        }
    },

    async mounted() {
        this.url_image = config.image
        if(this.$store.state.users.isAutoriztion.Auth == false)
            router.push('/auth')
        this.Quest()
    },

    methods: {
        Quest() {
            axios.post(`${config.url}/quest`, {
                "item": this.$route.params.item,
                "classes": this.$route.params.class
            })
            .then((response) => {
                this.isQuest = response.data.message
            })
        },

        submit() {
            axios.post(`${config.url}/answer`, {
                "answer": this.answer,
                "item": this.$route.params.item,
                "classes": this.$route.params.class,
                "mynicipal": localStorage.getItem("mynicipal"),
                "school": localStorage.getItem("school"),
                "u_class": localStorage.getItem("class"),
                "u_number": localStorage.getItem("number"),
            })
            .then((response) => {
                router.push(`/result/${response.data.code}`)
            })
            .catch((error) => {

            })
        }
    },
}
</script>

<style scoped>
.v-test {
    margin: 40px 0px;
}

.v-container-test {
    max-width: 1000px;
    margin: 0 auto;
}

h2 {
    text-align: center;
}

.v-test-quest, .v-test-card {
    margin: 20px 0px;
}

.v-test-quest {
    display: flex;
    align-items: flex-start;
}

.v-test-quest > img {
    margin-left: 20px;
}

input {
    width: 365px;
    padding-right: 25px;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    outline: none;
    height: 53px;
    padding: 0px 10px;
    border: 2px solid rgb(72, 251, 76);
    box-shadow: rgb(72, 251, 76) 0px 4px 0px;
    font-size: 14px;
}
</style>