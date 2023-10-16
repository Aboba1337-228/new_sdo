<template>
    <div class="v-card">
        <div class="v-card-inner">
            <img :src="image" alt="">
            <div class="v-card-data">
                <h2>{{ title }}</h2>
                <p>{{ text }}</p>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        image: String,
        title: String,
        text: String,
    }
}
</script>

<style scoped>
.v-card {
    margin: 20px 0px;
}

.v-card-inner {
    display: flex;
    align-items: center;
}

.v-card-data {
    margin-left: 30px;
    width: 450px;
}
</style>