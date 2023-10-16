<template>
    <div class="v-crumb">
        <span>Главная / {{title}}</span>
        <hr>
    </div>
</template>

<script>
export default {
    props: {
        title: String
    }
}
</script>