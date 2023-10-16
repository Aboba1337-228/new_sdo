<template>
    <div class="v-test">
        <div class="v-container-test">
            <h2>Тест</h2>
            <div class="v-test-data">
                <div class="v-test-card" 
                    v-for="i in 10" 
                    :key="i">
                    <div class="v-test-quest">{{i}}: <img src="" alt=""></div>
                    <input type="text" placeholder="Введите ответ">
                </div>
            </div>
            <BtnTest title="Завершить тест" />
        </div>
    </div>
</template>

<script>
import BtnTest from '../components/UI/Button/v-btn-form.vue'

export default {
    components: {
      BtnTest  
    }
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