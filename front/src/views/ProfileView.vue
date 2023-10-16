<template>
    <div class="v-profile">
        <div class="v-profile-container">
            <Crumb title="Профиль" />
            <h2>Мои данные</h2>
            <div class="v-profile-data">
                <p>Муниципалитет: 1</p>
                <p>Образовательное учереждение: 1</p>
                <p>Класс: 1</p>
                <p>Номер по списку: 1</p>
            </div>
            <BtnOut title="Выйти из аккаунта" />
        </div>
    </div>
</template>

<script>
import BtnOut from '../components/UI/Button/v-btn-form.vue'
import Crumb from '../components/UI/Crumb/v-crumb.vue'

export default {
    components: {
        BtnOut,
        Crumb
    }
}
</script>

<style scoped>
.v-profile-container {
    max-width: 1000px;
    margin: 0 auto;
}

p {
    line-height: 4px;
}

.v-profile-data {
    margin: 30px 0px;
}
</style>